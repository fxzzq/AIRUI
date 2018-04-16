package com.iweb.utils;

@SuppressWarnings("unused")
public class Page {

	private int page;//需要查询的页码
	private int rows;//需要查询的当前页条数
	private String sort;//排序字段
	private String order;//排序方式

	private int startIndex;
	private int endIndex;

	public int getStartIndex() {
		return (page - 1) * rows;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return page * rows;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public Page() {
		// TODO Auto-generated constructor stub
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}
