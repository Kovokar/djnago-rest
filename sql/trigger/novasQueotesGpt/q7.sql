--7. Liste os fornecedores cujo valor médio por
--item pedido é superior a R$ 210,00.


select f.nome_fornecedor from fornecedor f 
where f.cod_fornecedor in (
	select p.cod_fornecedor from pedido p
	group by p.cod_fornecedor
	having sum(p.valor_total_pedido)/ COUNT(p.cod_fornecedor) > 210
	order by p.cod_fornecedor
)