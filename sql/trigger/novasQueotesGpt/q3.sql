--3. Liste todos os pedidos feitos por cada fornecedor, 
--incluindo a data, o número de itens e o valor total.

select * from pedido p 
inner join fornecedor f 
on f.cod_fornecedor = p.cod_fornecedor 
order by p.cod_fornecedor 

SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO P order by p.cod_pedido ;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
