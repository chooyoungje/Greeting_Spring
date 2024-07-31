package model;

public class MemberProject {

	int projectId;
	String projectName;
	String team;
	String isGoing;
	String projectPeriod;
	String projectInfo;
	int resumeId;

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getIsGoing() {
		return isGoing;
	}

	public void setIsGoing(String isGoing) {
		this.isGoing = isGoing;
	}

	public String getProjectPeriod() {
		return projectPeriod;
	}

	public void setProjectPeriod(String projectPeriod) {
		this.projectPeriod = projectPeriod;
	}

	public String getProjectInfo() {
		return projectInfo;
	}

	public void setProjectInfo(String projectInfo) {
		this.projectInfo = projectInfo;
	}

	@Override
	public String toString() {
		return "MemberProject [projectId=" + projectId + ", projectName=" + projectName + ", team=" + team
				+ ", isGoing=" + isGoing + ", projectPeriod=" + projectPeriod + ", projectInfo=" + projectInfo
				+ ", resumeId=" + resumeId + "]";
	}

}
