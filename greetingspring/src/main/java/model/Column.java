package model;

public class Column {

    int annoId;	
    String columnTitle;	
    int columnStage;
    
	public int getannoId() {
		return annoId;
	}
	public void setannoId(int annoId) {
		this.annoId = annoId;
	}
	public String getColumnTitle() {
		return columnTitle;
	}
	public void setColumnTitle(String columnTitle) {
		this.columnTitle = columnTitle;
	}
	public int getColumnStage() {
		return columnStage;
	}
	public void setColumnStage(int columnStage) {
		this.columnStage = columnStage;
	}
	@Override
	public String toString() {
		return "Column [annoId=" + annoId + ", columnTitle=" + columnTitle + ", columnStage=" + columnStage + "]";
	}
    

    
	
}
