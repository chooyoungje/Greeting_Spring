package model;

public class Business {
	String businessId;
	String businessPw;
	String businessName;
	String address;
	int salary;
	String welfare;
	String ceo;
	int sales;
	int employees;
	String type;
	String industry;
	String detailIndustry;
	String homepage;
	String content;

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getBusinessPw() {
		return businessPw;
	}

	public void setBusinessPw(String businessPw) {
		this.businessPw = businessPw;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getWelfare() {
		return welfare;
	}

	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getEmployees() {
		return employees;
	}

	public void setEmployees(int employees) {
		this.employees = employees;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getDetailIndustry() {
		return detailIndustry;
	}

	public void setDetailIndustry(String detailIndustry) {
		this.detailIndustry = detailIndustry;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Business [businessId=" + businessId + ", businessPw=" + businessPw + ", businessName=" + businessName
				+ ", address=" + address + ", salary=" + salary + ", welfare=" + welfare + ", ceo=" + ceo + ", sales="
				+ sales + ", employees=" + employees + ", type=" + type + ", industry=" + industry + ", detailIndustry="
				+ detailIndustry + ", homepage=" + homepage + ", content=" + content + "]";
	}

}
