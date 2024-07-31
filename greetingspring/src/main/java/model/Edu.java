package model;

public class Edu {

	int eduId;
	String schoolType;
	String schoolName;
	String admissionDate;
	String graduateDate;
	String graduateState;
	String major;
	String score;
	String totalScore;
	int resumeId;

	public int getEduId() {
		return eduId;
	}

	public void setEduId(int eduId) {
		this.eduId = eduId;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public String getSchoolType() {
		return schoolType;
	}

	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getAdmissionDate() {
		return admissionDate;
	}

	public void setAdmissionDate(String admissionDate) {
		this.admissionDate = admissionDate;
	}

	public String getGraduateDate() {
		return graduateDate;
	}

	public void setGraduateDate(String graduateDate) {
		this.graduateDate = graduateDate;
	}

	public String getGraduateState() {
		return graduateState;
	}

	public void setGraduateState(String graduateState) {
		this.graduateState = graduateState;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}

	@Override
	public String toString() {
		return "Edu [eduId=" + eduId + ", schoolType=" + schoolType + ", schoolName=" + schoolName + ", admissionDate="
				+ admissionDate + ", graduateDate=" + graduateDate + ", graduateState=" + graduateState + ", major="
				+ major + ", score=" + score + ", totalScore=" + totalScore + ", resumeId=" + resumeId + "]";
	}

}
