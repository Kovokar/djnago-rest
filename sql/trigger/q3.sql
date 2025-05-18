--Crie um trigger que, sempre que a quantidade de 
--um livro (QTD_ESTOQUE) cair abaixo de 3, insira um log na tabela 
--CONTROLE_DE_ALTERACAO com operação 'M' 
--(mínimo) para indicar baixo estoque.

create or replace function verfica_qtd_warniug()
returns trigger as $$
begin
	
	if new.qtd_estoque < 3 then
		insert into CONTROLE_DE_ALTERACAO (operacao) 
			values ('ta pouco fila da puta maldito');
		raise notice 'ta pouco fila da puta maldito';
	
	end if;
	return new;
		
end;

$$ language plpgsql;



create trigger diabim2
after update on LIVRO
for each row
execute function verfica_qtd_warniug()


update livro
set qtd_estoque = qtd_estoque -1 
where cod_livro = 10



SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
