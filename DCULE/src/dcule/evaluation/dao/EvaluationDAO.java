package dcule.evaluation.dao;

import java.util.List;

import javax.validation.Valid;

import dcule.evaluation.vo.Evaluation;

public interface EvaluationDAO {

	void insertEvaluation(@Valid Evaluation evaluation);

	List<Evaluation> selectEvaluationList(Evaluation evaluation);

	Evaluation selectEvaluation(String evaluationId);

	void updateEvaluation(@Valid Evaluation evaluation);

	void deleteEvaluation(String evaluationId);
		
}
