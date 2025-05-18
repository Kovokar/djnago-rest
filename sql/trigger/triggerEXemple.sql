CREATE OR REPLACE FUNCTION registrar_alteracao_estoque()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se houve alteração na quantidade em estoque
    IF NEW.QTD_ESTOQUE IS DISTINCT FROM OLD.QTD_ESTOQUE THEN
        INSERT INTO CONTROLE_DE_ALTERACAO (
            OPERACAO, 
            DATA_HORA, 
            USUARIO_QUE_ALTEROU, 
            COD_ANTIGO, 
            COD_NOVO, 
            ESTOQUE_ANTIGO, 
            ESTOQUE_NOVO
        )
        VALUES (
            'U', -- Update
            CURRENT_TIMESTAMP, 
            CURRENT_USER, -- usuário conectado no banco
            OLD.COD_LIVRO, 
            NEW.COD_LIVRO, 
            OLD.QTD_ESTOQUE, 
            NEW.QTD_ESTOQUE
        );
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
