# 📚 Aluno Online API

## 📌 Descrição do Projeto

Este projeto consiste em uma API REST desenvolvida em Java utilizando o framework Spring Boot.
A aplicação tem como objetivo gerenciar alunos e professores, permitindo operações completas de CRUD (Create, Read, Update e Delete). A API foi testada utilizando o Insomnia e os dados persistidos foram validados através do DBeaver.

Este projeto foi desenvolvido como atividade acadêmica da disciplina de Java Spring.

---

## ⚙️ Tecnologias Utilizadas

* Java
* Spring Boot
* Spring Web
* Spring Data JPA
* Maven
* Banco de dados (MySQL ou H2)
* Insomnia (testes de API)
* DBeaver (visualização do banco de dados)

---

## 🏗️ Arquitetura do Projeto

O projeto segue o padrão de arquitetura em camadas (Layered Architecture):

### 🔹 Controller

Responsável por receber as requisições HTTP e retornar as respostas.

### 🔹 Service

Responsável pelas regras de negócio da aplicação.

### 🔹 Repository

Responsável pela comunicação com o banco de dados.

### 🔹 Model

Representa as entidades do sistema.

---

## 📂 Estrutura do Projeto

```
src/
 ├── controller
 ├── service
 ├── repository
 └── model
```

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

1. Clone o repositório:

```
git clone https://github.com/seu-usuario/aluno_online_api_java_spring.git
```

2. Abra no IntelliJ

3. Execute a classe principal:

```
AlunoOnlineApplication
```

4. Acesse:

```
http://localhost:8080
```

---

## 📌 Autor

Matheus Padilha Ramos Neves.
Projeto desenvolvido para fins acadêmicos.
