-- processo de criação da trigger que armazena em uma tabela a data, hora e o id da matricula que foi trancada.
CREATE TABLE IF NOT EXISTS public.historico_matriculas_trancadas (
  id SERIAL PRIMARY KEY,
  aluno_id INTEGER NOT NULL,
  aluno_nome VARCHAR(255) NOT NULL,
  disciplina_id INTEGER NOT NULL,
  disciplina_nome VARCHAR(255) NOT NULL,
  data_hora_trancamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE OR REPLACE FUNCTION public.registrar_matricula_trancada()
RETURNS TRIGGER AS $$
BEGIN
  IF LOWER(NEW.status::TEXT) = 'trancado'
     AND (
       TG_OP = 'INSERT'
       OR LOWER(COALESCE(OLD.status::TEXT, '')) <> 'trancado'
     ) THEN

    INSERT INTO public.historico_matriculas_trancadas (
      aluno_id,
      aluno_nome,
      disciplina_id,
      disciplina_nome,
      data_hora_trancamento
    )
    SELECT
      a.id,
      a.nome,
      d.id,
      d.nome,
      CURRENT_TIMESTAMP
    FROM public.aluno AS a
    JOIN public.disciplina AS d
      ON d.id = NEW.disciplina_id
    WHERE a.id = NEW.aluno_id;

  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_registrar_matricula_trancada
AFTER INSERT OR UPDATE OF status
ON public.matricula_aluno
FOR EACH ROW
EXECUTE FUNCTION public.registrar_matricula_trancada();


SELECT *
FROM public.historico_matriculas_trancadas;


ALTER TABLE public.historico_matriculas_trancadas
  DROP COLUMN IF EXISTS aluno_id,
  DROP COLUMN IF EXISTS aluno_nome,
  DROP COLUMN IF EXISTS disciplina_id,
  DROP COLUMN IF EXISTS disciplina_nome,
  ADD COLUMN IF NOT EXISTS matricula_id INTEGER;


CREATE OR REPLACE FUNCTION public.registrar_matricula_trancada()
RETURNS TRIGGER AS $$
BEGIN
  IF LOWER(NEW.status::TEXT) = 'trancado'
     AND (
       TG_OP = 'INSERT'
       OR LOWER(COALESCE(OLD.status::TEXT, '')) <> 'trancado'
     ) THEN

    INSERT INTO public.historico_matriculas_trancadas (
      matricula_id,
      data_hora_trancamento
    )
    VALUES (
      NEW.id,
      CURRENT_TIMESTAMP
    );

  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_registrar_matricula_trancada
ON public.matricula_aluno;

CREATE TRIGGER trg_registrar_matricula_trancada
AFTER INSERT OR UPDATE OF status
ON public.matricula_aluno
FOR EACH ROW
EXECUTE FUNCTION public.registrar_matricula_trancada();



-- trigger que armazena em uma tabela a data, hora e o id de cada novo aluno.
CREATE TABLE IF NOT EXISTS public.historico_novos_alunos (
  id SERIAL PRIMARY KEY,
  aluno_id INTEGER NOT NULL,
  data_cadastro DATE NOT NULL,
  hora_cadastro TIME NOT NULL
);


CREATE OR REPLACE FUNCTION public.registrar_novo_aluno()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.historico_novos_alunos (
    aluno_id,
    data_cadastro,
    hora_cadastro
  )
  VALUES (
    NEW.id,
    CURRENT_DATE,
    CURRENT_TIME
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_registrar_novo_aluno
ON public.aluno;

CREATE TRIGGER trg_registrar_novo_aluno
AFTER INSERT
ON public.aluno
FOR EACH ROW
EXECUTE FUNCTION public.registrar_novo_aluno();


SELECT *
FROM public.historico_novos_alunos
ORDER BY id DESC;



-- trigger que armazena em uma tabela a data, hora e o id de toda nova matricula.
CREATE TABLE IF NOT EXISTS public.historico_novas_matriculas (
  id SERIAL PRIMARY KEY,
  matricula_id INTEGER NOT NULL,
  data_matricula DATE NOT NULL,
  hora_matricula TIME NOT NULL
);


CREATE OR REPLACE FUNCTION public.registrar_nova_matricula()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.historico_novas_matriculas (
    matricula_id,
    data_matricula,
    hora_matricula
  )
  VALUES (
    NEW.id,
    CURRENT_DATE,
    CURRENT_TIME
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_registrar_nova_matricula
ON public.matricula_aluno;

CREATE TRIGGER trg_registrar_nova_matricula
AFTER INSERT
ON public.matricula_aluno
FOR EACH ROW
EXECUTE FUNCTION public.registrar_nova_matricula();


SELECT *
FROM public.historico_novas_matriculas
ORDER BY id DESC;



-- trigger que armazena em uma tabela a data, hora e o id de todo novo professor.
CREATE TABLE IF NOT EXISTS public.historico_novos_professores (
  id SERIAL PRIMARY KEY,
  professor_id INTEGER NOT NULL,
  data_cadastro DATE NOT NULL,
  hora_cadastro TIME NOT NULL
);


CREATE OR REPLACE FUNCTION public.registrar_novo_professor()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.historico_novos_professores (
    professor_id,
    data_cadastro,
    hora_cadastro
  )
  VALUES (
    NEW.id,
    CURRENT_DATE,
    CURRENT_TIME
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_registrar_novo_professor
ON public.professor;

CREATE TRIGGER trg_registrar_novo_professor
AFTER INSERT
ON public.professor
FOR EACH ROW
EXECUTE FUNCTION public.registrar_novo_professor();


SELECT *
FROM public.historico_novos_professores
ORDER BY id DESC;
