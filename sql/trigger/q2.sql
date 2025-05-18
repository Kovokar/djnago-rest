--1. Trigger de auditoria em PEDIDO
--Crie um trigger que registre toda vez que o valor total de um pedido (VALOR_TOTAL_PEDIDO) 
--for alterado, salvando os valores antigo e novo na tabela CONTROLE_DE_ALTERACAO.


create or replace function sla()
returns trigger as $$
begin
    IF OLD.valor_total_pedido IS DISTINCT FROM NEW.valor_total_pedido THEN
        INSERT INTO CONTROLE_DE_ALTERACAO (
            operacao, data_hora, usuario_que_alterou,
            cod_antigo, cod_novo,
            estoque_antigo, estoque_novo,
            preco_antigo, preco_novo
        )
        VALUES (
            'a', NOW(), 'pedro',
            OLD.cod_pedido, NEW.cod_pedido,
            666,666,
            OLD.valor_total_pedido, NEW.valor_total_pedido
        );
		raise notice 'att';
	end if;
	
	return new;
end;
$$ language plpgsql;



create trigger guarda_info
after update on PEDIDO
for each row 
execute function sla()


update pedido 
set valor_total_pedido = 170
where cod_pedido = 12


SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
