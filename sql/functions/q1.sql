
-- minha 

    CREATE OR REPLACE FUNCTION aplicar_logica_contrato(p_cliente_id INT, p_operadora_id INT)
    RETURNS NUMERIC AS $$
    DECLARE 
        novo_val NUMERIC;
        telefone_id INT;
        plano_id INT;
    BEGIN 
        -- Tenta buscar o valor do contrato com maior valor da operadora
        SELECT valor_final
        INTO novo_val
        FROM Contrato c
        JOIN Plano p ON p.id = c.plano_id
        WHERE c.cliente_id = p_cliente_id 
        AND p.operadora_id = p_operadora_id
        ORDER BY c.valor_final DESC
        LIMIT 1;

        -- Se encontrou contrato: aplicar desconto de 50%
        IF FOUND THEN
            RETURN novo_val * 0.5;

        ELSE 
            -- Cria novo telefone aleatório para o cliente
            INSERT INTO Telefone (numero, operadora_id)
            VALUES (
                '9' || FLOOR(RANDOM() * 1000000000)::TEXT,
                p_operadora_id
            )
            RETURNING id INTO telefone_id;

            -- Seleciona plano mais barato da operadora
            SELECT id INTO plano_id
            FROM Plano
            WHERE operadora_id = p_operadora_id
            ORDER BY valor
            LIMIT 1;

            -- Cria novo contrato com plano mais barato
            INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final)
            VALUES (
                p_cliente_id,
                telefone_id,
                plano_id,
                CURRENT_DATE,
                (SELECT valor FROM Plano WHERE id = plano_id)
            );

            -- Retorna o valor do novo contrato
            RETURN (SELECT valor FROM Plano WHERE id = plano_id);
        END IF;
    END;
    $$ LANGUAGE plpgsql;

-- gepeto
    CREATE OR REPLACE FUNCTION aplicar_desconto_ou_criar_contrato(
        p_cliente_id INT,
        p_operadora_id INT
    )
    RETURNS VOID AS $$
    DECLARE
        v_telefone_id INT;
        v_contrato_id INT;
        v_valor_maior NUMERIC;
        v_plano_id INT;
        v_plano_valor NUMERIC;
        v_telefone_existe BOOLEAN;
    BEGIN
        -- Verifica se o cliente tem telefone da operadora
        SELECT t.id
        INTO v_telefone_id
        FROM Telefone t
        JOIN Contrato c ON c.telefone_id = t.id
        WHERE t.operadora_id = p_operadora_id
        AND c.cliente_id = p_cliente_id
        LIMIT 1;

        v_telefone_existe := FOUND;

        IF v_telefone_existe THEN
            -- Cliente tem telefone da operadora
            -- Aplicar 50% de desconto no contrato de maior valor
            SELECT id, valor_final
            INTO v_contrato_id, v_valor_maior
            FROM Contrato
            WHERE cliente_id = p_cliente_id
            AND telefone_id = v_telefone_id
            ORDER BY valor_final DESC
            LIMIT 1;

            UPDATE Contrato
            SET valor_final = valor_final * 0.5
            WHERE id = v_contrato_id;

        ELSE
            -- Cliente NÃO tem telefone da operadora
            -- Criar telefone aleatório
            INSERT INTO Telefone (numero, operadora_id)
            VALUES (
                '9' || FLOOR(RANDOM() * 1000000000)::TEXT, -- Gera número fictício
                p_operadora_id
            )
            RETURNING id INTO v_telefone_id;

            -- Buscar plano mais barato da operadora
            SELECT id, valor
            INTO v_plano_id, v_plano_valor
            FROM Plano
            WHERE operadora_id = p_operadora_id
            ORDER BY valor ASC
            LIMIT 1;

            -- Criar novo contrato
            INSERT INTO Contrato (cliente_id, telefone_id, plano_id, data_contrato, valor_final)
            VALUES (
                p_cliente_id,
                v_telefone_id,
                v_plano_id,
                CURRENT_DATE,
                v_plano_valor
            );
        END IF;
    END;
    $$ LANGUAGE plpgsql;


