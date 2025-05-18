--c) Qual o nome do(s) fornecedor(es) que mais vendeu(eram)
--no mês de fevereiro de 2024?


select f.nome_fornecedor from fornecedor f 
where f.cod_fornecedor in (
	select p.cod_fornecedor
	from pedido p 
	where p.data_pedido > '2024-05-01' 
	group by p.cod_fornecedor 
	having sum(valor_total_pedido) = (
		select max(soma_total) as soma_tot from (
	        SELECT SUM(valor_total_pedido) AS soma_total
	        FROM pedido
	        WHERE data_pedido > '2024-05-01'
	        GROUP BY cod_fornecedor
	    ) AS sub
	)
)




SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
