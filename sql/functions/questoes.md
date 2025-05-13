
# Questões de Funções em SQL

---

## 🛰️ Banco de Dados 1 – Telefonia

### Estrutura

- **Telefone** (id, numero, operadora_id)
- **Cliente** (id, cpf, nome, rg, sexo, uf)
- **Operadora** (id, nome, cnpj)
- **Contrato** (id, cliente_id, telefone_id, plano_id, data_contrato, valor_final)
- **Plano** (id, valor, operadora_id, descricao)

---

### ✅ Questão Base (Original)

Crie uma função que receba o **ID de um cliente** e o **ID de uma operadora**, e:

- Verifique se o cliente já possui algum **telefone da operadora**.
- **Se sim**: aplique um **desconto de 50%** no contrato com o **maior valor**.
- **Se não**: crie um novo contrato usando o **plano de menor valor** da operadora.

---

### 📘 Questão 1 – Bonificação por Fidelidade

Crie uma função que receba o **ID de um cliente**.  
- Se ele tiver **mais de 3 contratos ativos com planos da mesma operadora**, aplique um **bônus de R$50** no **contrato mais recente**.  
- Caso contrário, nenhum bônus é aplicado.

---

### 📘 Questão 2 – Substituição de Plano por Mais Barato

Crie uma função que receba o **ID de um cliente** e o **ID de uma operadora**.  
- Se o cliente possui **dois ou mais contratos** com essa operadora, substitua o **plano mais caro** por um **plano mais barato** da mesma operadora.  
- Caso contrário, não faça nenhuma alteração.

---

### 📘 Questão 3 – Troca Automática de Plano

Crie uma função que receba o **ID de um contrato**.  
- Se houver um **plano mais barato com a mesma descrição** (por exemplo, "Plano Família") e da **mesma operadora**, substitua o plano do contrato.  
- Caso contrário, mantenha o plano atual.

---

### 📘 Questão 4 – Criação Automática de Telefone e Contrato

Crie uma função que receba o **ID de um cliente** e o **ID de uma operadora**.  
- Se o cliente **não tiver telefone com essa operadora**, crie um **novo telefone aleatório** associado à operadora e crie um contrato com o **plano mais caro**.  
- Caso já possua telefone, apenas crie um contrato com o **plano de valor médio** da operadora.

---

### 📘 Questão 5 – Desconto Progressivo por Quantidade de Contratos

Crie uma função que receba o **ID de um cliente**.  
Para **cada contrato** do cliente com a **mesma operadora**, aplique um desconto progressivo no `valor_final`:

- 1º contrato: **sem desconto**
- 2º contrato: **10% de desconto**
- 3º ou mais contratos: **20% de desconto**

A ordem dos contratos deve ser definida pela `data_contrato`.

---

## 📚 Banco de Dados 2 – Biblioteca Digital

### Estrutura

- **Livro** (`id`, `titulo`, `autor_id`, `categoria_id`, `ano_publicacao`, `disponivel`)
- **Autor** (`id`, `nome`, `pais`)
- **Categoria** (`id`, `nome`)
- **Usuario** (`id`, `nome`, `email`, `data_nascimento`)
- **Emprestimo** (`id`, `usuario_id`, `livro_id`, `data_emprestimo`, `data_devolucao`, `multa`)

---

### 📘 Questão 1 – Avaliação de Multa

Crie uma função que receba o **ID de um empréstimo**.  
- Se a `data_devolucao` for maior que 7 dias após a `data_emprestimo`, aplique uma **multa de R$2 por dia de atraso**.  
- Caso contrário, a multa deve ser **zero**.

---

### 📘 Questão 2 – Emprestar Livro Automaticamente

Crie uma função que receba o **ID de um usuário** e o **ID de uma categoria**.  
- Encontre o **primeiro livro disponível** da categoria.  
- Crie um **empréstimo para o usuário** com a data atual.  
- Marque o livro como **indisponível**.  
- Se não houver livros disponíveis, **não crie o empréstimo**.

---

### 📘 Questão 3 – Idade Média dos Autores por Categoria

Crie uma função que receba o **nome de uma categoria** e retorne a **média de idade dos autores** dos livros dessa categoria, considerando o **ano atual** como referência.

---

### 📘 Questão 4 – Recomendação por Autor

Crie uma função que receba o **ID de um usuário** e retorne até **3 livros de autores** que esse usuário **já leu** (ou seja, já pegou emprestado), mas **ainda não leu esses livros específicos**.

---

### 📘 Questão 5 – Aniversariante Ganha Livro

Crie uma função que verifique se hoje é o **aniversário de algum usuário**.  
Para cada aniversariante:

- Selecione um **livro disponível aleatório**;
- Marque o livro como **indisponível**;
- Registre um **empréstimo gratuito** (sem multa, com devolução prevista para 14 dias depois da data atual).

---