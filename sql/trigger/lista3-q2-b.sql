--b) Mostre o nome de um dos fornecedores que mais 
--vendeu no mês de fevereiro de 2024.


select f.nome_fornecedor from fornecedor f 
where f.cod_fornecedor in (
	select cod_fornecedor
	from pedido p 
	where p.data_pedido > '2024-05-01'
	group by cod_fornecedor 
	order by sum(valor_total_pedido) desc limit 1	
)




SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
