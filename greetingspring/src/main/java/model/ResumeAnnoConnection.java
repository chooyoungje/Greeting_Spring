package model;

public class ResumeAnnoConnection {

	int resumeId;
	int annoId;
	String resume_register_date;
	String resume_check_date;
	int columnStage = 1;
	int resumeScore = 0;

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

	public String getResume_register_date() {
		return resume_register_date;
	}

	public void setResume_register_date(String resume_register_date) {
		this.resume_register_date = resume_register_date;
	}

	public String getResume_check_date() {
		return resume_check_date;
	}

	public void setResume_check_date(String resume_check_date) {
		this.resume_check_date = resume_check_date;
	}

	public int getColumnStage() {
		return columnStage;
	}

	public void setColumnStage(int columnStage) {
		this.columnStage = columnStage;
	}

	public int getResumeScore() {
		return resumeScore;
	}

	public void setResumeScore(int resumeScore) {
		this.resumeScore = resumeScore;
	}

	@Override
	public String toString() {
		return "ResumeAnnoConnection [resumeId=" + resumeId + ", annoId=" + annoId + ", resume_register_date="
				+ resume_register_date + ", resume_check_date=" + resume_check_date + ", columnStage=" + columnStage
				+ ", resumeScore=" + resumeScore + "]";
	}

}
