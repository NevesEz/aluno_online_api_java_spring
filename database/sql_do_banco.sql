CREATE DATABASE aluno_online;

USE aluno_online;

-- =========================================
-- TABELA PROFESSOR
-- =========================================

CREATE TABLE professor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    cpf VARCHAR(255)
);

-- =========================================
-- TABELA ALUNO
-- =========================================

CREATE TABLE aluno (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(255),
    email VARCHAR(255)
);

-- =========================================
-- TABELA DISCIPLINA
-- =========================================

CREATE TABLE disciplina (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    carga_horaria INT,

    professor_id BIGINT,

    CONSTRAINT fk_disciplina_professor
        FOREIGN KEY (professor_id)
        REFERENCES professor(id)
);

-- =========================================
-- TABELA MATRICULA_ALUNO
-- =========================================

CREATE TABLE matricula_aluno (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,

    aluno_id BIGINT,
    disciplina_id BIGINT,

    nota1 DOUBLE,
    nota2 DOUBLE,

    status ENUM(
        'MATRICULADO',
        'APROVADO',
        'REPROVADO',
        'TRANCADO',
        'DESLIGADO'
    ),

    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES aluno(id),

    CONSTRAINT fk_matricula_disciplina
        FOREIGN KEY (disciplina_id)
        REFERENCES disciplina(id)
);

-- =========================================
-- INSERTS EXEMPLO
-- =========================================

INSERT INTO professor (nome, email, cpf)
VALUES
('Carlos Silva', 'carlos@email.com', '11111111111'),
('Ana Souza', 'ana@email.com', '22222222222');

INSERT INTO aluno (nome, cpf, email)
VALUES
('João Pedro', '33333333333', 'joao@email.com'),
('Maria Clara', '44444444444', 'maria@email.com');

INSERT INTO disciplina (nome, carga_horaria, professor_id)
VALUES
('Banco de Dados', 60, 1),
('Programação Orientada a Objetos', 80, 2);

INSERT INTO matricula_aluno (
    aluno_id,
    disciplina_id,
    nota1,
    nota2,
    status
)
VALUES
(1, 1, 8.5, 7.0, 'APROVADO'),
(2, 2, 5.0, 4.5, 'REPROVADO');