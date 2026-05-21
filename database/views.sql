-- view que mostra o id dos alunos e seus nomes que estão matriculados simultaneamente nas disciplinas de id 1 e 5.
CREATE OR REPLACE VIEW public.vw_alunos_disciplinas_1_e_5 AS
SELECT
  a.id,
  a.nome
FROM public.aluno AS a
JOIN (
  SELECT
    aluno_id
  FROM public.matricula_aluno
  WHERE disciplina_id IN (1, 5)
  GROUP BY aluno_id
  HAVING COUNT(DISTINCT disciplina_id) = 2
) AS m ON m.aluno_id = a.id;


SELECT *
FROM vw_alunos_disciplinas_1_e_5;



-- view que mostra o id do aluno, nome dele, id da disciplina e seu nome que estão com suas matriculas trancadas.
CREATE OR REPLACE VIEW public.vw_alunos_matriculas_trancadas AS
SELECT
  a.id AS aluno_id,
  a.nome AS aluno_nome,
  d.id AS disciplina_id,
  d.nome AS disciplina_nome
FROM public.matricula_aluno AS m
JOIN public.aluno AS a
  ON a.id = m.aluno_id
JOIN public.disciplina AS d
  ON d.id = m.disciplina_id
WHERE LOWER(m.status) = 'trancado';


SELECT *
FROM public.vw_alunos_matriculas_trancadas;



-- view que mostra o id do aluno, seu nome, id da disciplina e seu nome que estão aprovados.
CREATE OR REPLACE VIEW public.vw_alunos_aprovados AS
SELECT
  a.id AS aluno_id,
  a.nome AS aluno_nome,
  d.id AS disciplina_id,
  d.nome AS disciplina_nome
FROM public.matricula_aluno AS m
JOIN public.aluno AS a
  ON a.id = m.aluno_id
JOIN public.disciplina AS d
  ON d.id = m.disciplina_id
WHERE m.status = 'APROVADO';


SELECT *
FROM public.vw_alunos_aprovados;



-- view que mostra o id do aluno, seu nome, id da disciplina e seu nome que estão reprovados.
CREATE OR REPLACE VIEW public.vw_alunos_reprovados AS
SELECT
  a.id AS aluno_id,
  a.nome AS aluno_nome,
  d.id AS disciplina_id,
  d.nome AS disciplina_nome
FROM public.matricula_aluno AS m
JOIN public.aluno AS a
  ON a.id = m.aluno_id
JOIN public.disciplina AS d
  ON d.id = m.disciplina_id
WHERE m.status = 'REPROVADO';


SELECT *
FROM public.vw_alunos_reprovados;
