package br.com.alunoonline.api.service;

import br.com.alunoonline.api.MatriculaAlunoStatusEnum;
import br.com.alunoonline.api.dtos.AtualizarNotasRequestDTO;
import br.com.alunoonline.api.dtos.DisciplinasAlunoResponseDTO;
import br.com.alunoonline.api.dtos.HistoricoAlunoResponseDTO;
import br.com.alunoonline.api.model.Aluno;
import br.com.alunoonline.api.model.MatriculaAluno;
import br.com.alunoonline.api.repository.MatriculaAlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MatriculaAlunoService {

    @Autowired
    MatriculaAlunoRepository matriculaAlunoRepository;

    private static final Double MEDIA_PARA_APROVACAO = 7.0;

    // ═══════════════ ATUALIZAR NOTAS ═══════════════
    public void atualizarNotas(Long id,
                               AtualizarNotasRequestDTO dto) {

        // 1) Buscar matrícula (mesmo padrão do trancar)
        MatriculaAluno matricula =
                matriculaAlunoRepository.findById(id)
                        .orElseThrow(() -> new ResponseStatusException(
                                HttpStatus.NOT_FOUND,
                                "Matricula não encontrada"));

        // 2) Só atualiza o que veio preenchido (PATCH parcial!)
        if (dto.getNota1() != null)
            matricula.setNota1(dto.getNota1());
        if (dto.getNota2() != null)
            matricula.setNota2(dto.getNota2());

        // 3) Se as 2 notas existem, calcula média e define status
        if (matricula.getNota1() != null
                && matricula.getNota2() != null) {
            Double media = (matricula.getNota1()
                    + matricula.getNota2()) / 2;
            matricula.setStatus(
                    media >= MEDIA_PARA_APROVACAO
                            ? MatriculaAlunoStatusEnum.APROVADO
                            : MatriculaAlunoStatusEnum.REPROVADO);
        }

        // 4) Salvar a matrícula atualizada
        matriculaAlunoRepository.save(matricula);
    }

    public void criarMatricula(MatriculaAluno matriculaAluno) {
        matriculaAluno.setStatus(MatriculaAlunoStatusEnum.MATRICULADO);
        matriculaAlunoRepository.save(matriculaAluno);
    }

    public void trancarMatricula(Long id) {

        // 1 - Buscar matricula antes de atualizar, se nao existir - 404 (not found)
        MatriculaAluno matriculaAluno = matriculaAlunoRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        // 2 - so pode trancar se estiver matriculado
        if (matriculaAluno.getStatus()
                .equals(MatriculaAlunoStatusEnum.MATRICULADO)) {
            matriculaAluno.setStatus(
                    MatriculaAlunoStatusEnum.TRANCADO);
            matriculaAlunoRepository.save(matriculaAluno);
        } else {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Só é possível trancar com status MATRICULADO");
        }
    }

    public void destrancarMatricula(Long id) {

        MatriculaAluno matriculaAluno = matriculaAlunoRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        if (matriculaAluno.getStatus()
                .equals(MatriculaAlunoStatusEnum.TRANCADO)) {
            matriculaAluno.setStatus(
                    MatriculaAlunoStatusEnum.MATRICULADO);
            matriculaAlunoRepository.save(matriculaAluno);
        } else {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Só é possível destrancar com status TRANCADO");
        }
    }

    public HistoricoAlunoResponseDTO emitirHistorico(Long alunoId) {

        List<MatriculaAluno> matriculas =
                matriculaAlunoRepository.findByAlunoId(alunoId);

        if (matriculas.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    "Nenhuma matrícula encontrada para esse aluno");
        }

        Aluno aluno = matriculas.get(0).getAluno();

        List<DisciplinasAlunoResponseDTO> disciplinas =
                new ArrayList<>();

        for (MatriculaAluno matricula : matriculas) {
            DisciplinasAlunoResponseDTO disc =
                    new DisciplinasAlunoResponseDTO();

            disc.setNomeDisciplina(matricula.getDisciplina().getNome());
            disc.setNomeProfessor(
                    matricula.getDisciplina().getProfessor().getNome());
            disc.setNota1(matricula.getNota1());
            disc.setNota2(matricula.getNota2());

            if (matricula.getNota1() != null
                && matricula.getNota2() != null) {
                Double media = (matricula.getNota1()
                              + matricula.getNota2()) / 2;
                disc.setMedia(media);
            }

            disc.setStatus(matricula.getStatus());
            disciplinas.add(disc);
        }

        HistoricoAlunoResponseDTO historico = new HistoricoAlunoResponseDTO();
        historico.setNomeAluno(aluno.getNome());
        historico.setEmailAluno(aluno.getEmail());
        historico.setCpfAluno(aluno.getCpf());
        historico.setDisciplinas(disciplinas);

        return historico;
    }
}
