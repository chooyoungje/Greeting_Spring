package model;


public class Resume {
	int resumeId;

	String resumeTitle;
	String selfInfo;
	String certification;
	String language;
	String address;
	String profileImage;
	String name;
	String birth;
	String phone;
	String email;

	String registDate;
	Career career;
	MemberProject project;
	MemberPortfolio portfolio;
	Edu edu;

	String memberId;
	String businessId;
	int columnStage = 1; // 기본값 0
	int resumeScore = 0; // 기본값 0

	int isDefault = 0;
	String resumeCheckDate;
	String registerToCompanyDate; // 회사 공고에 지원한 날짜
	int annoId;

	public String getRegisterToCompanyDate() {
		return registerToCompanyDate;
	}

	public void setRegisterToCompanyDate(String registerToCompanyDate) {
		this.registerToCompanyDate = registerToCompanyDate;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}

	public String getSelfInfo() {
		return selfInfo;
	}

	public void setSelfInfo(String selfInfo) {
		this.selfInfo = selfInfo;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Career getCareer() {
		return career;
	}

	public void setCareer(Career career) {
		this.career = career;
	}

	public MemberProject getProject() {
		return project;
	}

	public void setProject(MemberProject project) {
		this.project = project;
	}

	public MemberPortfolio getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(MemberPortfolio portfolio) {
		this.portfolio = portfolio;
	}

	public Edu getEdu() {
		return edu;
	}

	public void setEdu(Edu edu) {
		this.edu = edu;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
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

	public String getResumeCheckDate() {
		return resumeCheckDate;
	}

	public void setResumeCheckDate(String resumeCheckDate) {
		this.resumeCheckDate = resumeCheckDate;
	}

	public int getAnnoId() {
		return annoId;
	}

	public void setAnnoId(int annoId) {
		this.annoId = annoId;
	}

	@Override
	public String toString() {
		return "Resume [resumeId=" + resumeId + ", resumeTitle=" + resumeTitle + ", selfInfo=" + selfInfo
				+ ", certification=" + certification + ", language=" + language + ", address=" + address
				+ ", profileImage=" + profileImage + ", name=" + name + ", birth=" + birth + ", phone=" + phone
				+ ", email=" + email + ", registDate=" + registDate + ", career=" + career + ", project=" + project
				+ ", portfolio=" + portfolio + ", edu=" + edu + ", memberId=" + memberId + ", businessId=" + businessId
				+ ", columnStage=" + columnStage + ", resumeScore=" + resumeScore + ", isDefault=" + isDefault
				+ ", resumeCheckDate=" + resumeCheckDate + ", registerToCompanyDate=" + registerToCompanyDate
				+ ", annoId=" + annoId + "]";
	}

}
