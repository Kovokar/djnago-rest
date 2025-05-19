--b) Crie um trigger na tabela Livro que não permita quantidade 
--em estoque negativa e sempre que a quantidade em estoque atingir
--10 ou menos unidades, um aviso de quantidade mínima
--deve ser emitido ao usuário (para emitir alertas sem
--interromper a execução da transação você pode usar 
--"raise notice" ou "raise info").


create or replace function verifica_estoque_livros()
returns trigger as $$
begin
	if new.qtd_estoque < 10 then
		raise notice 'QUANTIDADE DE LIVROS BAIXA';
	end if;
	return new;
end;
$$ language plpgsql;



create trigger verifica_estoque_livros
after update on livro
for each row 
execute function verifica_estoque_livros()

update livro 
set qtd_estoque = 9
where cod_livro = 3


SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
