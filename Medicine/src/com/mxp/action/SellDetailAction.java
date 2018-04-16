package com.mxp.action;

import java.util.List;

import com.mxp.entity.TbShopcart;
import com.mxp.service.SellDetailService;
import com.mxp.util.Page;

public class SellDetailAction extends BaseAction {

	List<TbShopcart> shopcarts;

	public void setShopcarts(List<TbShopcart> shopcarts) {
		this.shopcarts = shopcarts;
	}

	public List<TbShopcart> getShopcarts() {
		return shopcarts;
	}

	private SellDetailService sellDetailService;

	public void setSellDetailService(SellDetailService sellDetailService) {
		this.sellDetailService = sellDetailService;
	}

	/**
	 * 选购药品
	 * @throws Exception
	 */
	public void enterBuy() throws Exception {

		sellDetailService.saveBuy(shopcarts);

	}

	/**
	 * 查看选购
	 * @throws Exception
	 */
	public void querychose() throws Exception {
		if (page == null) {
			page = new Page();
		}
		JSONWrite(sellDetailService.findDataGrid(page));
	}

	/**
	 * 付款
	 * @throws Exception
	 */
	public void payMedicine() throws Exception {
		boolean fals = false;
		if (ids != null) {
			fals = sellDetailService.modifyShopCart(ids);
		}
		JSONWrite(fals);
	}

	/**
	 * 查看明细
	 * @throws Exception
	 */
	public void querySelled() throws Exception {
		if (page == null) {
			page = new Page();
		}
		JSONWrite(sellDetailService.findDataGridSelled(page));
	}

	/**
	 * 今日明细
	 * @throws Exception
	 */
	public void queryToday() throws Exception {

		if (page == null) {
			page = new Page();
		}
		JSONWrite(sellDetailService.findDataGridToday(page));
	}

	/**
	 * 日期查询
	 * @throws Exception
	 */
	public void queryDate() throws Exception {
		System.out.println("queryDate");
		if (page == null) {
			page = new Page();
		}
		JSONWrite(sellDetailService.queryDate(startTime, endTime, page));
	}

	/**
	 * 销售排行
	 * @throws Exception
	 */
	public void orderSell() throws Exception {
		if (page == null) {
			page = new Page();
		}
		JSONWrite(sellDetailService.findDataGridorderSell(page));
	}

}
