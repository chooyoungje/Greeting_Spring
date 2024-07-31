package model;

import java.io.Serializable;

public class Search implements Serializable {
	private String part;
	private String searchData;
	private String sortData;

	public Search() {
	}

	public Search(String part, String searchData) {
		super();
		this.part = part;
		this.searchData = searchData;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

	public String getSortData() {
		return sortData;
	}

	public void setSortData(String sortData) {
		this.sortData = sortData;
	}

	@Override
	public String toString() {
		return "Search [part=" + part + ", searchData=" + searchData + ", sortData=" + sortData + "]";
	}

}
