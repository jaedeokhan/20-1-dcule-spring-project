package dcule.evaluation.svc;

import java.util.List;

import javax.validation.Valid;

import dcule.evaluation.vo.Evaluation;

public interface EvaluationService {

	void addEvaluation(@Valid Evaluation evaluation);

	List<Evaluation> getEvaluationList(Evaluation evaluation);

	Evaluation findByEvaluationId(String evaluationId);

	void modifyEvaluation(@Valid Evaluation evaluation);

	void removeEvaluation(String evaluationId);

}
