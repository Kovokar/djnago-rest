--a) Crie triggers que implementem todas essas restrições 
--de chave primária, chave estrangeira
--e valores não nulos nas tabelas Pedido e Item_pedido.

create trigger trigger_verifica_pedido_null
before update on pedido
for each row 
execute function verifica_pedido_null()


create trigger trigger_verifica_item_pedido_null
before update on item_pedido
for each row 
execute function verifica_item_pedido_null()


create or replace function verifica_pedido_null()
returns trigger as $$
begin 
	if new.cod_fornecedor IS NULL or
	   new.cod_pedido is null THEN
		raise exception 'NAO É POSSIVEL ALTERAR ESSES CAMPOS';
    end if;
	return new;
end;
$$ language plpgsql;


create or replace function verifica_item_pedido_null()
returns trigger as $$
begin 
	if new.cod_item_pedido is null or 
		new.cod_pedido is null or 
		new.cod_livro is null then 
			raise exception 'NAO É POSSIVEL ALTERAR ESSES CAMPOS AAAINNNNNNN';
	end if;
	return row;
end;
$$ language plpgsql;




update item_pedido 
set cod_livro = null 
where cod_pedido  = 2



SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
