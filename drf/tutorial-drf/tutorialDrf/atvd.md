
# Atividade: Construção de uma API utilizando Django REST Framework (DRF)

## Objetivo
O objetivo dessa atividade é praticar os principais conceitos do Django REST Framework (DRF) na construção de uma API para um sistema de cursos online, onde os alunos podem avaliar os cursos e os instrutores podem adicionar novos cursos.

## Descrição
Você irá criar uma API com as seguintes funcionalidades:
1. Criação de cursos por instrutores.
2. Listagem de todos os cursos e de um curso específico.
3. Avaliação dos cursos pelos alunos (com nota e comentário).
4. Listagem de avaliações de um curso específico.

## Etapas da Atividade

### 1. Criação dos Modelos
Você deverá criar os seguintes modelos em Django:

- **Instrutor**: Representa o instrutor do curso. Atributos: nome (string), e-mail (string).
- **Curso**: Representa os cursos oferecidos. Atributos: nome (string), descrição (texto) e o instrutor que ministrará o curso (relacionamento de chave estrangeira com o modelo `Instrutor`).
- **Avaliacao**: Representa a avaliação dos alunos sobre os cursos. Atributos: aluno (nome do aluno, string), nota (inteiro de 1 a 5), comentário (texto) e curso (relacionamento com o modelo `Curso`).

### 2. Criação dos Serializers
Para cada modelo, crie um serializer que converta os dados do banco de dados em formato JSON (e vice-versa). Você precisará de serializers para os modelos `Instrutor`, `Curso` e `Avaliacao`.

### 3. Criação das Views
Implemente as views utilizando **ViewSets** e decore as funções com os decoradores adequados do Django REST Framework:

- **CursoViewSet**: Realize as operações CRUD (Create, Read, Update, Delete) para os cursos. A ação de listagem deve retornar todos os cursos e a ação de detalhe deve retornar um curso específico.
- **AvaliacaoViewSet**: Realize as operações CRUD para avaliações de cursos, associando as avaliações aos cursos corretamente.
- Implemente uma ação personalizada para listar todas as avaliações de um curso específico.

### 4. Configuração das URLs
Configure as URLs da sua API utilizando o `router` do DRF para criar as rotas de acesso às suas views, garantindo que a API permita as seguintes funcionalidades:

- Listar todos os cursos.
- Criar um novo curso.
- Listar os detalhes de um curso.
- Adicionar uma avaliação para um curso específico.
- Listar todas as avaliações de um curso.

### 5. Testando a API
Depois de implementar o código, faça testes para garantir que todas as operações estão funcionando corretamente. Utilize ferramentas como o **Postman** ou o **Django REST Framework's Browsable API** para testar sua API.

## Requisitos
- Django >= 3.0
- Django REST Framework >= 3.12
- Banco de dados SQLite (padrão)

## Critérios de Avaliação
- Implementação correta dos modelos.
- Implementação correta dos serializers.
- Uso adequado dos ViewSets e decoradores do Django REST Framework.
- Funcionamento correto da API (testada usando o Postman ou outro cliente HTTP).

## Entrega
Envie o código do seu projeto, incluindo a configuração do Django e os arquivos necessários para rodar a API (migrations, etc.), juntamente com um arquivo README explicando como rodar o projeto.
