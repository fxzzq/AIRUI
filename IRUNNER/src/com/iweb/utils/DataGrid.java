package com.iweb.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DataGrid implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long total = 0;

	private List<?> rows = new ArrayList<Object>();

	public List<?> getRows()
	{
		return rows;
	}

	public void setRows(List<?> rows)
	{
		this.rows = rows;
	}

	public long getTotal()
	{
		return total;
	}

	public void setTotal(long total)
	{
		this.total = total;
	}

}
