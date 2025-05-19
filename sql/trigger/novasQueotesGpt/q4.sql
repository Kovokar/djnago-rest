-- Q4: Total de livros e gasto por fornecedor em março de 2024
-- Escreva sua consulta SQL aqui
--4. Mostre o total de livros comprados (quantidade)
--e o total gasto por fornecedor em março de 2024.

select count(*), sum(p.valor_total_pedido) from pedido p 

select sum(p.valor_total_pedido) as tot_por_fornecedor, 
count(p.cod_pedido) as vendas_por_fornecedor 
from pedido p 
group by p.cod_fornecedor 
order by tot_por_fornecedor desc



SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO P order by p.cod_fornecedor ;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
