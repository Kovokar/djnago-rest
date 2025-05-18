import json
import os

ARQUIVO_JSON = 'dados.json'

def salvar_dados():
    nome = input("Digite seu nome: ")
    idade = input("Digite sua idade: ")

    # Verifica se o arquivo existe e carrega os dados existentes
    if os.path.exists(ARQUIVO_JSON):
        with open(ARQUIVO_JSON, 'r') as f:
            try:
                dados = json.load(f)
            except json.JSONDecodeError:
                dados = []
    else:
        dados = []

    # Adiciona os novos dados
    dados.append({"nome": nome, "idade": idade})

    # Salva os dados no arquivo JSON
    with open(ARQUIVO_JSON, 'w') as f:
        json.dump(dados, f, indent=4)
    print("Dados salvos com sucesso.")

def ler_dados():
    if not os.path.exists(ARQUIVO_JSON):
        print("Nenhum dado encontrado.")
        return

    with open(ARQUIVO_JSON, 'r') as f:
        try:
            dados = json.load(f)
            print("Dados salvos:")
            for pessoa in dados:
                print(f"Nome: {pessoa['nome']}, Idade: {pessoa['idade']}")
        except json.JSONDecodeError:
            print("Erro ao ler o arquivo JSON.")

def main():
    while True:
        print("\n1 - Salvar dados")
        print("2 - Ler dados")
        print("3 - Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            salvar_dados()
        elif opcao == '2':
            ler_dados()
        elif opcao == '3':
            break
        else:
            print("Opção inválida.")

# Chama a função principal
main()
