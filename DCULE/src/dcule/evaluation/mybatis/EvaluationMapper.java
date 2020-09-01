package dcule.evaluation.mybatis;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;

import dcule.evaluation.vo.Evaluation;

public interface EvaluationMapper {

	void insertEvaluation(@Valid Evaluation evaluation); // 강의평가 등록
	List<Evaluation> selectEvaluationList(Evaluation evaluation); // 강의평가 목록 조회
	Evaluation selectEvaluation(String evaluationId); // evaluationId에 해당하는 글 출력
	void updateEvaluation(@Valid Evaluation evaluation); // 강의평가 수정
	void deleteEvaluation(String evaluationId); // 강의평가 삭제
	
}
