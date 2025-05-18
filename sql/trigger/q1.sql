--crie um trigger que, sempre que houver decremento da quantidade 
--em estoque de determinado produto, decremente tambem, 
--caso seja necessário, a qunatidade em estoque dos 
--produtos que são compostos por aquele produto que foi decrementado]



create or replace function decremento_qtd_estoque()
returns trigger as $$
begin
	if old.qtd_estoque > new.qtd_estoque then
		update titulo
		set qtd_titulos = qtd_titulos - 1
        WHERE cod_titulo = NEW.cod_titulo;
	end if;

	return new;
END;
$$ LANGUAGE plpgsql;



create trigger decrementa_satanas
after update on livro
for each row 
execute function decremento_qtd_estoque();


UPDATE livro 
SET qtd_titulos = qtd_titulos - (OLD.qtd_estoque - NEW.qtd_estoque)
WHERE cod_livro = 4;


SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
