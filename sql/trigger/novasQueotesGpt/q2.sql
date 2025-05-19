-- Q2: Livros com valor acima da média
-- Escreva sua consulta SQL aqui
--2. Mostre os livros cujo valor unitário seja maior 
--do que a média dos valores dos livros.


select T.nome_titulo from titulo t 
where t.cod_titulo in (
	select l.cod_titulo from livro l 
	where l.valor_livro > (select avg(l.valor_livro) from livro l )
)



SELECT * FROM TITULO order by cod_titulo ;

SELECT * FROM LIVRO order by cod_livro 

SELECT * FROM FORNECEDOR;

SELECT * FROM PEDIDO;

SELECT * FROM ITEM_PEDIDO;

SELECT * FROM CONTROLE_DE_ALTERACAO;
