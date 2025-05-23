CREATE OR REPLACE FUNCTION FUNCAO_CONTROLA_ITEM()
RETURNS TRIGGER
AS $$
BEGIN
    UPDATE LIVRO SET QTD_ESTOQUE=QTD_ESTOQUE-NEW.QUANT 
    WHERE COD_LIVRO=NEW.COD_LIVRO;
    
    UPDATE PEDIDO SET QUANT_ITENS=QUANT_ITENS+NEW.QUANT, VALOR_TOTAL_PEDIDO=VALOR_TOTAL_PEDIDO+NEW.VALOR_TOTAL_ITEM 
    WHERE COD_PEDIDO=NEW.COD_PEDIDO;
    
    RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;


CREATE TRIGGER CONTROLA_ITEM
BEFORE INSERT OR DELETE OR UPDATE
ON ITEM_PEDIDO
FOR EACH ROW
EXECUTE PROCEDURE FUNCAO_CONTROLA_ITEM();