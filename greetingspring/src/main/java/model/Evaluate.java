package model;

public class Evaluate {


	
	int resumeId;
	int annoId;
	
	// 평가 단계
	int evaluateStage;
	// 평가 날짜
	String evaluateDate;
	
	// 직무 적성 점수
	int suitableScore;
	// 직무 적성 평가 내용
	String suitableContent;
	
	//실무 점수
	int practicalScore;
	// 실무 평가 내용
	String practicalContent;
	
	// 평균 점수
	int avgScore;

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public int getAnnoId() {
		return annoId;
	}

	public void setAnnoId(int annoId) {
		this.annoId = annoId;
	}

	public int getEvaluateStage() {
		return evaluateStage;
	}

	public void setEvaluateStage(int evaluateStage) {
		this.evaluateStage = evaluateStage;
	}

	public String getEvaluateDate() {
		return evaluateDate;
	}

	public void setEvaluateDate(String evaluateDate) {
		this.evaluateDate = evaluateDate;
	}

	public int getSuitableScore() {
		return suitableScore;
	}

	public void setSuitableScore(int suitableScore) {
		this.suitableScore = suitableScore;
	}

	public String getSuitableContent() {
		return suitableContent;
	}

	public void setSuitableContent(String suitableContent) {
		this.suitableContent = suitableContent;
	}

	public int getPracticalScore() {
		return practicalScore;
	}

	public void setPracticalScore(int practicalScore) {
		this.practicalScore = practicalScore;
	}

	public String getPracticalContent() {
		return practicalContent;
	}

	public void setPracticalContent(String practicalContent) {
		this.practicalContent = practicalContent;
	}

	public int getavgScore() {
		return avgScore;
	}

	public void setavgScore(int avgScore) {
		this.avgScore = avgScore;
	}

	@Override
	public String toString() {
		return "Evaluate [resumeId=" + resumeId + ", annoId=" + annoId + ", evaluateStage=" + evaluateStage
				+ ", evaluateDate=" + evaluateDate + ", suitableScore=" + suitableScore + ", suitableContent="
				+ suitableContent + ", practicalScore=" + practicalScore + ", practicalContent=" + practicalContent
				+ ", avgScore=" + avgScore + "]";
	}
	
	
	
	
}
