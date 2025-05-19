--6. Mostre o nome do fornecedor que vendeu mais livros em 
--uantidade (e não em valor) em fevereiro de 2024


select * from fornecedor f 
where f.cod_fornecedor in (
	select p.cod_fornecedor from pedido p 
	group by p.cod_fornecedor 
	having count(p.cod_fornecedor) in (
		select count(p.cod_fornecedor)  from pedido p 
		group by p.cod_fornecedor 
		order by count(p.cod_fornecedor) desc 
		limit 1
	)
	order by count(p.cod_fornecedor) desc 
)
