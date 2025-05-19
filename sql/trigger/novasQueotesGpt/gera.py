"""Consultas SQL (SELECT)
1. Liste todos os títulos de livros que possuem menos de 5 unidades em estoque.
2. Mostre os livros cujo valor unitário seja maior do que a média dos valores dos livros.
3. Liste todos os pedidos feitos por cada fornecedor, incluindo a data, o número de itens e o valor total.
4. Mostre o total de livros comprados (quantidade) e o total gasto por fornecedor em março de 2024.
5. Liste os títulos que nunca foram pedidos.

Consultas com Subconsultas ou Agregações
6. Mostre o nome do fornecedor que vendeu mais livros em quantidade (e não em valor) em fevereiro de 2024.
7. Liste os fornecedores cujo valor médio por item pedido é superior a R$ 100,00.
8. Mostre os títulos mais comprados (em quantidade total somada) em todos os tempos.

Atualização e Manutenção de Dados
9. Atualize o estoque dos livros de acordo com os pedidos realizados.
10. Diminua o valor unitário de todos os livros em 10% se o estoque estiver acima de 100 unidades.

Triggers e Integridade
11. Crie uma trigger na tabela Pedido que, ao inserir um pedido, verifique se o valor total do pedido corresponde à soma dos valores totais dos itens associados.
12. Crie uma trigger na tabela Item_pedido para atualizar automaticamente o estoque do livro ao registrar um item do pedido.
13. Crie uma trigger que impeça a exclusão de um livro que ainda esteja referenciado em algum pedido.

Procedures / Funções Avançadas (Opcional)
14. Crie uma função que, dado o código de um fornecedor, retorne o total de livros fornecidos por ele no último trimestre.
15. Crie uma procedure que aceite um título e atualize o valor de todos os livros relacionados, com base em um percentual informado.

"""