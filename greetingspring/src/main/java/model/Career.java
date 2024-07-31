package model;

public class Career {

	int careerId;
	String companyName;
	String department;
	String workPart;
	String position;
	String workType;
	String isWorking;
	String workPeriod;
	int resumeId;

	public int getCareerId() {
		return careerId;
	}

	public void setCareerId(int careerId) {
		this.careerId = careerId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getWorkPart() {
		return workPart;
	}

	public void setWorkPart(String workPart) {
		this.workPart = workPart;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public String getIsWorking() {
		return isWorking;
	}

	public void setIsWorking(String isWorking) {
		this.isWorking = isWorking;
	}

	public String getWorkPeriod() {
		return workPeriod;
	}

	public void setWorkPeriod(String workPeriod) {
		this.workPeriod = workPeriod;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	@Override
	public String toString() {
		return "Career [careerId=" + careerId + ", companyName=" + companyName + ", department=" + department
				+ ", workPart=" + workPart + ", position=" + position + ", workType=" + workType + ", isWorking="
				+ isWorking + ", workPeriod=" + workPeriod + ", resumeId=" + resumeId + "]";
	}

}
