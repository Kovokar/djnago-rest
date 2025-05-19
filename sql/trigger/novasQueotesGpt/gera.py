# gerar_arquivos_sql.py

# Lista de títulos das questões
titulos = [
    "Q1: Títulos com menos de 5 unidades em estoque",
    "Q2: Livros com valor acima da média",
    "Q3: Pedidos por fornecedor",
    "Q4: Total de livros e gasto por fornecedor em março de 2024",
    "Q5: Títulos nunca pedidos",
    "Q6: Fornecedor que vendeu mais livros em quantidade em fevereiro de 2024",
    "Q7: Fornecedores com valor médio por item pedido superior a R$ 100,00",
    "Q8: Títulos mais comprados em quantidade total",
    "Q9: Atualizar estoque com base nos pedidos",
    "Q10: Reduzir preço de livros com grande estoque",
    "Q11: Trigger para validar valor total do pedido",
    "Q12: Trigger para atualizar estoque ao registrar item",
    "Q13: Trigger para impedir exclusão de livro com pedidos",
    "Q14: Função para total de livros fornecidos no último trimestre",
    "Q15: Procedure para atualizar valores de livros por título"
]

# Geração dos arquivos
for i, titulo in enumerate(titulos, 1):
    filename = f"q{i}.sql"
    with open(filename, "w", encoding="utf-8") as f:
        f.write(f"-- {titulo}\n")
        f.write("-- Escreva sua consulta SQL aqui\n")
    print(f"Arquivo criado: {filename}")
