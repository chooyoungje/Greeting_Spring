package model;

public class Sort {
    private String sortData;
    private String ascDesc;

    // Getters and Setters
    public String getSortData() {
        return sortData;
    }

    public void setSortData(String sortData) {
        this.sortData = sortData;
    }

    public String getAscDesc() {
        return ascDesc;
    }

    public void setAscDesc(String ascDesc) {
        this.ascDesc = ascDesc;
    }

	@Override
	public String toString() {
		return "Sort [sortData=" + sortData + ", ascDesc=" + ascDesc + "]";
	}
    
    
}