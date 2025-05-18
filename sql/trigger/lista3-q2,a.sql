--2) Responda as questões a seguir:
--a) Mostre o nome dos fornecedores que venderam mais de X 
--reais no mês de fevereiro de 2024

create or replace function vendeu_mais_que_X3(x int)
RETURNS TABLE(nome_fornecedor varchar(100)) AS $$
begin
	return query
	select f.nome_fornecedor from fornecedor f 
	where f.cod_fornecedor in (
		select cod_fornecedor
		from pedido p 
		group by cod_fornecedor 
		having sum(valor_total_pedido) > x
	);
end;
$$ language plpgsql;


select * from vendeu_mais_que_X3(500)


SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
