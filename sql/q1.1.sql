-- gepeto

    CREATE OR REPLACE FUNCTION aplicar_bonus_fidelidade(p_cliente_id INT)
    RETURNS TEXT AS $$
    DECLARE
        v_operadora_id INT;
        v_contrato_id INT;
    BEGIN
        -- Procura uma operadora com a qual o cliente tenha mais de 3 contratos
        SELECT p.operadora_id
        INTO v_operadora_id
        FROM Contrato c
        JOIN Plano p ON p.id = c.plano_id
        WHERE c.cliente_id = p_cliente_id
        GROUP BY p.operadora_id
        HAVING COUNT(*) > 3
        LIMIT 1;

        -- Se encontrou, aplica bônus no contrato mais recente
        IF FOUND THEN
            SELECT c.id
            INTO v_contrato_id
            FROM Contrato c
            JOIN Plano p ON p.id = c.plano_id
            WHERE c.cliente_id = p_cliente_id AND p.operadora_id = v_operadora_id
            ORDER BY c.data_contrato DESC
            LIMIT 1;

            -- Aplica bônus (subtrai 50 reais)
            UPDATE Contrato
            SET valor_final = valor_final - 50
            WHERE id = v_contrato_id;

            RETURN 'Bônus de R$50 aplicado ao contrato mais recente.';
        ELSE
            RETURN 'Cliente não possui mais de 3 contratos com a mesma operadora.';
        END IF;
    END;
    $$ LANGUAGE plpgsql;

-- meu programa
    create or replace function bonificacao(p_id_cliente int )
    returns void as $$
    declare 
        qtd_max_contratos numeric;
    begin
        select count(*) INTO qtd_max_contratos from plano p 
        where id in (select plano_id from contrato c 
                where cliente_id = p_id_cliente)
        group by operadora_id 
        order by count(*) desc limit 1;


        if qtd_max_contratos >= 3 then
            update contrato 
            set valor_final = valor_final - 50
            where data_contrato = (
                select MAX(data_contrato) FROM Contrato
                        where cliente_id = p_id_cliente);
        else
            RAISE NOTICE 'Nada ocorreu.';
        end if;

    end
    $$ LANGUAGE plpgsql;