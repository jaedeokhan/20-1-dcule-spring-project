package dcule.evaluation.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class EvaluationModify {
	
	private int evaluationId;

	@NotEmpty(message="강의명을 입력해주세요")
	@Size(min=0, max=30)
	private String lectureName;
	
	@NotEmpty(message="교수명을 입력해주세요")
	@Size(min=0, max=30)
	private String professorName;
	
	private int lectureYear;
	private String semesterDivide;
	private String lectureDivide;
	
	@NotEmpty(message="강의평가 제목을 입력해주세요")
	@Size(min=0, max=30)
	private String evaluationTitle;
	
	@NotEmpty(message="강의평가을  내용을입력해주세요")
	@Size(min=0, max=1024)
	private String evaluationContent;
	
	private String totalScore;
	private int homeworkCount;
	private String groupTask;
	private String professorLectureAbility;
	private String gradeSatisfaction ;
	private String examDifficulty;
	
	public int getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(int evaluationId) {
		this.evaluationId = evaluationId;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public int getLectureYear() {
		return lectureYear;
	}
	public void setLectureYear(int lectureYear) {
		this.lectureYear = lectureYear;
	}
	public String getSemesterDivide() {
		return semesterDivide;
	}
	public void setSemesterDivide(String semesterDivide) {
		this.semesterDivide = semesterDivide;
	}
	public String getLectureDivide() {
		return lectureDivide;
	}
	public void setLectureDivide(String lectureDivide) {
		this.lectureDivide = lectureDivide;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public int getHomeworkCount() {
		return homeworkCount;
	}
	public void setHomeworkCount(int homeworkCount) {
		this.homeworkCount = homeworkCount;
	}
	public String getGroupTask() {
		return groupTask;
	}
	public void setGroupTask(String groupTask) {
		this.groupTask = groupTask;
	}
	public String getProfessorLectureAbility() {
		return professorLectureAbility;
	}
	public void setProfessorLectureAbility(String professorLectureAbility) {
		this.professorLectureAbility = professorLectureAbility;
	}
	public String getGradeSatisfaction() {
		return gradeSatisfaction;
	}
	public void setGradeSatisfaction(String gradeSatisfaction) {
		this.gradeSatisfaction = gradeSatisfaction;
	}
	public String getExamDifficulty() {
		return examDifficulty;
	}
	public void setExamDifficulty(String examDifficulty) {
		this.examDifficulty = examDifficulty;
	}
}
