package com.mxp.service;

import java.util.List;

import com.mxp.entity.TbShopcart;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public interface SellDetailService {

	void saveBuy(List<TbShopcart> shopcarts) throws Exception;

	DataGrid findDataGrid(Page page) throws Exception;

	boolean modifyShopCart(String ids)throws Exception;

	DataGrid findDataGridSelled(Page page)throws Exception;

	DataGrid findDataGridToday(Page page)throws Exception;

	DataGrid findDataGridorderSell(Page page)throws Exception;

	DataGrid queryDate(String startTime, String endTime,Page page)throws Exception;

}
