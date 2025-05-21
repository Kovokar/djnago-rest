/*CRIE UM TRIGGER QUE, SEMPRE QUE HOUVER DECREMENTO DA QUANTIDADE 
EM ESTOQUE DE UM DETERMINADO PRODUTO, 
DECREMENTE TAMBÉM, CASO SEJA NECESSÁRIO, A QUANTIDADE EM ESTOQUE 
DO PRODUTOS QUE SÃO COMPOSTOS POR AQUELE QUE FOI DECREMENTADO.*/

create or replace function decrementa_produto()
returns trigger as $$
declare 
	id_prod INT;
begin
	if new.qtd_em_estoque < old.qtd_em_estoque then
		update combo
		set qtd_prod_no_combo = qtd_prod_no_combo - 1
		where cod_prod_do_combo = new.cod_prod;
		RAISE NOTICE 'Estoque atual: %', NEW.qtd_em_estoque;
		RAISE NOTICE 'Estoque anterior: %', old.qtd_em_estoque;
	end if;
	return new;
end;
$$ language plpgsql;


create or replace trigger aa
before update on PRODUTO
for each row
execute function decrementa_produto()

update produto c
set qtd_em_estoque = qtd_em_estoque - 1
where c.cod_prod = 1


SELECT * FROM CLIENTE;
SELECT * FROM FUNCIONARIO;
SELECT * FROM PRODUTO;
SELECT * FROM COMBO c order by c.cod_combo;
SELECT * FROM VENDA;
SELECT * FROM ITEM_VENDA;



