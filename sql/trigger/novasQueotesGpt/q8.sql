--8. Mostre os títulos mais comprados 
--(em quantidade total somada) em todos os tempos.


select t.nome_titulo from titulo t 
where t.cod_titulo in (
	select l.cod_titulo from livro l
	where l.cod_livro in (
		select ip.cod_livro from item_pedido ip 
		group by ip.cod_livro
		having count(ip.cod_livro) = (
			select count(ip.cod_livro) from item_pedido ip 
			group by ip.cod_livro
			order by ip.cod_livro limit 1
		)
	)
)

insert into pedido (cod_pedido, cod_fornecedor, hora_pedido, data_pedido, valor_total_pedido)
values (18, 1, '12:12:00', now(), 80)


insert into item_pedido (cod_item_pedido, cod_pedido, cod_livro)
values (18, 18, 1)
