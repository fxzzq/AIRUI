package com.mxp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mxp.dao.CategoryDao;
import com.mxp.dao.MedicineDao;
import com.mxp.entity.TbCategory;
import com.mxp.entity.TbMedicine;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public class MedicineServiceImp implements MedicineService {

	private MedicineDao<TbMedicine> medicineDao;

	private CategoryDao<TbCategory> categoryDao;

	public void setCategoryDao(CategoryDao<TbCategory> categoryDao) {
		this.categoryDao = categoryDao;
	}

	public void setMedicineDao(MedicineDao<TbMedicine> medicineDao) {
		this.medicineDao = medicineDao;
	}

	
	public DataGrid findDataGrid(Page p) throws Exception {

		int page = p.getPage();
		int count = p.getCount();
		String hql = "select count(*) from TbMedicine";

		int counts = Integer.parseInt(medicineDao.findUnique(hql).toString());

		hql = "from TbMedicine";
		List<TbMedicine> list = medicineDao.findList(hql, page, count);

		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);

		return dataGrid;
	}

	
	public List<TbCategory> getCategory() throws Exception {
		return categoryDao.findList("from TbCategory");
	}

	
	public boolean saveMedicine(TbMedicine tbMedicine) throws Exception {

		String hql = "select count(*) from TbMedicine where medno = :medno";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("medno", tbMedicine.getMedno());
		int count = Integer.parseInt(medicineDao.findUnique(hql, map).toString());
		if (count == 0) {
			medicineDao.save(tbMedicine);
			return true;
		}
		return false;
	}

	
	public TbMedicine getUpdateEntity(Long id) throws Exception {
		return medicineDao.findByID(TbMedicine.class, id);
	}

	
	public boolean updateMedicine(TbMedicine tbMedicine) throws Exception {

		TbMedicine t = medicineDao.findByID(TbMedicine.class, tbMedicine.getId());
		t.setDescription(tbMedicine.getDescription());
		t.setPrice(tbMedicine.getPrice());
		return true;
	}

	
	public boolean removeMedicine(String ids) throws Exception {

		String[] sid = ids.split(",");

		for (String id : sid) {
			if (id != null && !"".equals(id.trim())) {
				medicineDao.delete(new TbMedicine(Long.parseLong(id)));
			}
		}

		return true;
	}

	
	public boolean modifyStock(TbMedicine tbMedicine) throws Exception {

		if (tbMedicine.getId() != null && !"".equals(tbMedicine.getId())) {
			TbMedicine t = medicineDao.findByID(TbMedicine.class, tbMedicine.getId());
			t.setMedcount(tbMedicine.getMedcount());
			return true;
		}
		return false;
	}
}
