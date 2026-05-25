# 📚 Aluno Online API

## 📌 Descrição do Projeto

Este projeto consiste em uma API REST desenvolvida em Java utilizando o framework Spring Boot.
A aplicação tem como objetivo gerenciar alunos, professores, disciplinas e matrículas, permitindo operações completas de CRUD (Create, Read, Update e Delete), além de funcionalidades acadêmicas como trancamento de matrícula, atualização de notas e emissão de histórico escolar.

A API foi testada utilizando o Insomnia e os dados persistidos foram validados através do DBeaver.

O projeto utiliza arquitetura em camadas, DTOs para transferência de dados, relacionamento entre entidades com JPA/Hibernate e integração com banco de dados PostgreSQL, incluindo utilização de Views e Triggers para automatização e organização de consultas no banco.

Este projeto foi desenvolvido como atividade acadêmica da disciplina de Java Spring.

---

## ⚙️ Tecnologias Utilizadas

* Java
* Spring Boot
* Spring Web
* Spring Data JPA
* Hibernate
* Maven
* PostgreSQL
* DTO (Data Transfer Object)
* JPA Relationships (ManyToOne)
* SQL Triggers
* SQL Views
* Insomnia (testes de API)
* DBeaver (visualização do banco de dados)
  
---

## 🏗️ Arquitetura do Projeto

O projeto segue o padrão de arquitetura em camadas (Layered Architecture), promovendo organização, reutilização de código e separação de responsabilidades.

🔹 Controller

Responsável por receber as requisições HTTP, processar endpoints REST e retornar as respostas da API.

🔹 Service

Responsável pelas regras de negócio da aplicação e tratamento das operações.

🔹 Repository

Responsável pela comunicação com o banco de dados através do Spring Data JPA.

🔹 Model

Representa as entidades do sistema e seus relacionamentos.

 🔹 DTO

Responsável pela transferência de dados entre as camadas da aplicação, evitando exposição direta das entidades.

🔹 Database

Banco de dados PostgreSQL contendo:

* tabelas relacionais
* Views SQL
* Triggers SQL
* constraints e relacionamentos

```

📂 Estrutura do Projeto
src/
 ├── controller
 ├── dto
 ├── service
 ├── repository
 ├── model
 ├── config
 └── resources
      ├── application.properties
      └── database

---

🔗 Relacionamentos JPA

O projeto utiliza relacionamentos entre entidades através do JPA/Hibernate.

✔ ManyToOne

Exemplo:

Uma matrícula pertence a um aluno
Uma matrícula pertence a uma disciplina
Uma disciplina pode possuir um professor

Esses relacionamentos foram implementados utilizando:

@ManyToOne
@JoinColumn(name = "id_aluno")
private Aluno aluno;

---

## 🗄️ Banco de Dados PostgreSQL

O projeto utiliza o PostgreSQL como banco de dados principal.

Além das tabelas relacionais, foram implementados:

🔹 Views

Utilizadas para facilitar consultas acadêmicas e relatórios.

🔹 Triggers

Responsáveis por automatizar comportamentos no banco de dados, garantindo maior integridade e automação.

---

## 👨‍🎓 CRUD de Aluno

* ➕ Criar aluno → POST /alunos
* 📋 Listar alunos → GET /alunos
* 🔍 Buscar por ID → GET /alunos/{id}
* ✏️ Atualizar → PUT /alunos/{id}
* ❌ Deletar → DELETE /alunos/{id}

---

## 👨‍🏫 CRUD de Professor

* ➕ Criar professor → POST /professores
* 📋 Listar professores → GET /professores
* 🔍 Buscar por ID → GET /professores/{id}
* ✏️ Atualizar → PUT /professores/{id}
* ❌ Deletar → DELETE /professores/{id}

---

## 📚 CRUD de Disciplina
  
* ➕ Criar disciplina → POST /disciplinas
* 📋 Listar disciplinas → GET /disciplinas
* 🔍 Buscar disciplina por ID → GET /disciplinas/{id}
* ✏️ Atualizar disciplina → PUT /disciplinas/{id}
* ❌ Deletar disciplina → DELETE /disciplinas/{id}

---

## 📝 Funcionalidades de Matrícula

* ➕ Criar matrícula
* 🔒 Trancar matrícula
* 🔓 Destrancar matrícula
* 📝 Atualizar notas
* 📄 Emitir histórico escolar

---

## 🧪 Testes no Insomnia

### Criar Aluno
![criar aluno](./prints/insomnia_criar_aluno.png)

### Buscar Alunos Por Id
![buscar alunos por id](./prints/insomnia_buscar_alunos_por_id.png)

### Listar Todos Os Alunos
![listar todos os alunos](./prints/insomnia_listar_todos_alunos.png)

### Deletar Aluno Por Id
![deletar aluno por id](./prints/insomnia_deletar_aluno_por_id.png)

### Atualizar Aluno Por Id
![atualizar aluno por id](./prints/insomnia_atualizar_aluno_por_id.png)

### Criar Professor
![criar professor](./prints/insomnia_criar_professor.png)

### Buscar Professor Por Id
![buscar professor por id](./prints/insomnia_buscar_professor_por_id.png)

### Listar Todos Os Professores
![listar todos os professores](./prints/insomnia_listar_todos_os_professores.png)

### Deletar Professor Por Id
![deletar professor por id](./prints/insomnia_deletar_professor_por_id.png)

### Atualizar Professor Por Id
![atualizar professor por id](./prints/insomnia_atualizar_professor_por_id.png)

### Criar Disciplina
![criar disciplina](./prints/insomnia_criar_disciplina.png)

### Listar Todas Disciplinas
![listar todas disciplinas](./prints/insomnia_listar_todas_disciplinas.png)

### Buscar Disciplina Por Id
![buscar disciplina por id](./prints/insomnia_buscar_disciplina_por_id.png)

### Deletar Disciplina Por Id
![deletar disciplina por id](./prints/insomnia_deletar_disciplina_por_id.png)

### Atualizar Disciplina Por Id
![atualizar disciplina por id](./prints/insomnia_atualizar_disciplina_por_id.png)

### Criar Matricula
![criar matricula](./prints/insomnia_criar_matricula.png)

### Trancar Matricula Por Id
![trancar matricula por id](./prints/insomnia_trancar_matricula_por_id.png)

### Atualizar Notas Por Id
![atualizar notas por id](./prints/insomnia_atualizar_notas_por_id.png)

### Destrancar Matricula Por Id
![destrancar matricula por id](./prints/insomnia_destrancar_matricula_por_id.png)

### Emitir Historico Por Id
![emitir historico por id](./prints/insomnia_emitir_historico_por_id.png)

---

## 🗄️ Banco de Dados

### Tabela Aluno
![tabela aluno](./prints/dbeaver_tabela_aluno_new.png)

### Tabela Professor
![tabela professor](./prints/dbeaver_tabela_professor_new.png)

### Tabela Disciplina
![tabella disciplina](./prints/dbeaver_tabela_disciplina.png)

### Tabela Matricula Aluno
![tabela matricula aluno](./prints/dbeaver_tabela_matricula_aluno.png)

---

## 🚀 Como Executar o Projeto

1️⃣ Clone o repositório
git clone https://github.com/NevesEz/aluno_online_api_java_spring.git


2️⃣ Abra no IntelliJ IDEA

Importe o projeto Maven normalmente.


3️⃣ Configure o PostgreSQL

Edite o arquivo:

application.properties

Configure:

spring.datasource.url=
spring.datasource.username=
spring.datasource.password=


4️⃣ Execute a aplicação

Execute a classe principal:

AlunoOnlineApplication


5️⃣ Acesse a API
http://localhost:8080

---

## 📖 Conceitos Aplicados

* API REST
* CRUD
* Spring Boot
* DTO Pattern
* JPA/Hibernate
* Relacionamentos ManyToOne
* PostgreSQL
* SQL Triggers
* SQL Views
* Arquitetura em Camadas
* Persistência de Dados
* Boas práticas REST

---

## 📌 Autor

Matheus Padilha Ramos Neves.
Projeto desenvolvido para fins acadêmicos.
