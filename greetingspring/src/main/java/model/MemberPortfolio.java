package model;

public class MemberPortfolio {

	int portfolioId;
	int resumeId;
	String portfolioUrl;
	String portfolioFile;

	public int getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(int portfolioId) {
		this.portfolioId = portfolioId;
	}

	public int getResumeId() {
		return resumeId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public String getPortfolioUrl() {
		return portfolioUrl;
	}

	public void setPortfolioUrl(String portfolioUrl) {
		this.portfolioUrl = portfolioUrl;
	}

	public String getPortfolioFile() {
		return portfolioFile;
	}

	public void setPortfolioFile(String portfolioFile) {
		this.portfolioFile = portfolioFile;
	}

	@Override
	public String toString() {
		return "MemberPortfolio [portfolioId=" + portfolioId + ", resumeId=" + resumeId + ", portfolioUrl="
				+ portfolioUrl + ", portfolioFile=" + portfolioFile + "]";
	}

}
