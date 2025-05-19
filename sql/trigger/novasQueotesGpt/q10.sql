--10. Diminua o valor unitário de todos os 
--livros em 10% se o estoque estiver acima de 100 unidades.

create or replace function diminui_preco_baseado_no_estoque()
returns trigger as $$
declare 
	tot numeric;
begin
	select sum(l.qtd_estoque) into tot from livro l;
	if tot > 100 then
		raise notice 'aaa';
		new.valor_livro := new.valor_livro * 0.9;
	end if;
	return new;
end;
$$ language plpgsql;


create trigger diminui_preco_baseado_no_estoque2
after update on livro
for each row
execute function diminui_preco_baseado_no_estoque();


update livro l
set qtd_estoque = 12
where l.cod_livro = 1
