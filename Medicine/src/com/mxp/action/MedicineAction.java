package com.mxp.action;

import com.mxp.entity.TbMedicine;
import com.mxp.service.MedicineService;
import com.mxp.util.Page;

public class MedicineAction extends BaseAction {

	private TbMedicine tbMedicine;

	public void setTbMedicine(TbMedicine tbMedicine) {
		this.tbMedicine = tbMedicine;
	}

	public TbMedicine getTbMedicine() {
		return tbMedicine;
	}

	private MedicineService medicineService;

	public void setMedicineService(MedicineService medicineService) {
		this.medicineService = medicineService;
	}

	/**
	 * 获取需要修改的对象
	 * @throws Exception
	 */
	public void getUpdateEntity() throws Exception {
		TbMedicine t = null;
		if (tbMedicine != null) {
			t = medicineService.getUpdateEntity(tbMedicine.getId());
		}
		JSONWrite(t);
	}

	/**
	 * 添加药品
	 * @throws Exception
	 */
	public void addmedicine() throws Exception {
		boolean fals = false;
		if (tbMedicine != null) {
			fals = medicineService.saveMedicine(tbMedicine);
		}
		JSONWrite(fals);
	}

	/**
	 * 获取药品类别的名称
	 * @throws Exception
	 */
	public void getCategory() throws Exception {
		JSONWrite(medicineService.getCategory());
	}

	/**
	 * 获取药品管理界面的内容
	 * @throws Exception
	 */
	public void medicine() throws Exception {

		if (page == null) {
			page = new Page();
		}
		JSONWrite(medicineService.findDataGrid(page));

	}
	
	public void updatemedicine()throws Exception{
		
		boolean fals = false;
		if (tbMedicine != null) {
			fals = medicineService.updateMedicine(tbMedicine);
		}
		JSONWrite(fals);
		
	}
	
	/**
	 * 删除药品信息
	 * @throws Exception
	 */
	public void remove()throws Exception{
		boolean fals = false;
		if (ids != null) {
			fals = medicineService.removeMedicine(ids);
		}
		JSONWrite(fals);
	}

	/**
	 * 修改库存
	 * @throws Exception
	 */
	public void stockmodify()throws Exception{
		boolean fals = false;
		if (tbMedicine != null) {
			fals = medicineService.modifyStock(tbMedicine);
		}
		JSONWrite(fals);
		
	}
}
