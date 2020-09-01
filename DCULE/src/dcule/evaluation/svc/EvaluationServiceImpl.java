package dcule.evaluation.svc;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dcule.evaluation.dao.EvaluationDAO;
import dcule.evaluation.vo.Evaluation;

@Service
public class EvaluationServiceImpl implements EvaluationService{

	@Autowired
	private EvaluationDAO evaluationDAO;
	
	@Override
	public void addEvaluation(@Valid Evaluation evaluation) {
		evaluationDAO.insertEvaluation(evaluation);
	}

	@Override
	public List<Evaluation> getEvaluationList(Evaluation evaluation) {
		
		return evaluationDAO.selectEvaluationList(evaluation);
	}

	@Override
	public Evaluation findByEvaluationId(String evaluationId) {

		return evaluationDAO.selectEvaluation(evaluationId);
	}

	@Override
	public void modifyEvaluation(@Valid Evaluation evaluation) {
		evaluationDAO.updateEvaluation(evaluation);
		
	}

	@Override
	public void removeEvaluation(String evaluationId) {
		evaluationDAO.deleteEvaluation(evaluationId);
	}
	
}
