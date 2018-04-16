package com.mxp.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
public class DataGrid implements Serializable {

	private long counts = 0;

	private long pages = 0;
	

	private List<?> rows = new ArrayList<Object>();

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public long getCounts() {
		return counts;
	}

	public void setCounts(long counts) {
		this.counts = counts;
	}

	public long getPages() {
		return pages;
	}

	public void setPages(long pages) {
		this.pages = pages;
	}

}
