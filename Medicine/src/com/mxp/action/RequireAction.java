package com.mxp.action;

import com.mxp.entity.TbMedicine;
import com.mxp.service.RequireService;

public class RequireAction extends BaseAction {

	private RequireService requireService;

	private TbMedicine tbMedicine;


	public void setTbMedicine(TbMedicine tbMedicine) {
		this.tbMedicine = tbMedicine;
	}

	public TbMedicine getTbMedicine() {
		return tbMedicine;
	}

	public void setRequireService(RequireService requireService) {
		this.requireService = requireService;
	}


	/**
	 * 修改进货
	 * @throws Exception
	 */
	public void requiredmodify() throws Exception {
		boolean fals = false;
		if (tbMedicine != null) {
			fals = requireService.modifyRequired(tbMedicine);
		}
		JSONWrite(fals);
	}

	/**
	 * 确认进货
	 * @throws Exception
	 */
	public void editRequired() throws Exception {
		boolean fals = false;
		if(ids!=null){
			fals = requireService.editRequired(ids);
		}
		JSONWrite(fals);
	}

}
