--9. Atualize o estoque dos livros de acordo com os pedidos realizados.


create or replace function att_estoque()
returns trigger as $$

begin
	update LIVRO 
	set qtd_estoque = qtd_estoque - 1
	where cod_livro = new.cod_livro;
	
	raise notice 'estoque decrementado';
	return new;
end;
$$ language plpgsql;


create trigger att_estoque
after insert on item_pedido
for each row 
execute function att_estoque()



insert into pedido (cod_pedido, cod_fornecedor, hora_pedido, data_pedido, valor_total_pedido)
values (19, 4, '12:12:00', now(), 180)


insert into item_pedido (cod_item_pedido, cod_pedido, cod_livro)
values (19, 19, 5)
