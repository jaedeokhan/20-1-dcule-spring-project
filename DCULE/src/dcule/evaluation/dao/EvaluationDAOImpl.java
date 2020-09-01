package dcule.evaluation.dao;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dcule.evaluation.mybatis.EvaluationMapper;
import dcule.evaluation.vo.Evaluation;

@Repository
public class EvaluationDAOImpl implements EvaluationDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertEvaluation(@Valid Evaluation evaluation) {
		EvaluationMapper evaluationMapper = sqlSession.getMapper(EvaluationMapper.class);
		evaluationMapper.insertEvaluation(evaluation);
	}

	@Override
	public List<Evaluation> selectEvaluationList(Evaluation evaluation) {
		EvaluationMapper evaluationMapper = sqlSession.getMapper(EvaluationMapper.class);
		return evaluationMapper.selectEvaluationList(evaluation);
	}

	@Override
	public Evaluation selectEvaluation(String evaluationId) {
		EvaluationMapper evaluationMapper = sqlSession.getMapper(EvaluationMapper.class);
		return evaluationMapper.selectEvaluation(evaluationId);
	}

	@Override
	public void updateEvaluation(@Valid Evaluation evaluation) {
		EvaluationMapper evaluationMapper = sqlSession.getMapper(EvaluationMapper.class);
		evaluationMapper.updateEvaluation(evaluation);
	}

	@Override
	public void deleteEvaluation(String evaluationId) {
		EvaluationMapper evaluationMapper = sqlSession.getMapper(EvaluationMapper.class);
		evaluationMapper.deleteEvaluation(evaluationId);
	}

}
