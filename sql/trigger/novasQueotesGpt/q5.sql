--5. Liste os títulos que nunca foram pedidos.

select * from livro l 
where cod_livro not in (
	select cod_livro from pedido p 
)