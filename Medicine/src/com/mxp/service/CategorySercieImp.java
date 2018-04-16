package com.mxp.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mxp.dao.CategoryDao;
import com.mxp.dao.MedicineDao;
import com.mxp.entity.TbCategory;
import com.mxp.entity.TbMedicine;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public class CategorySercieImp implements CategorySercie {

	private CategoryDao<TbCategory> categoryDao;

	private MedicineDao<TbMedicine> medicineDao;

	public void setMedicineDao(MedicineDao<TbMedicine> medicineDao) {
		this.medicineDao = medicineDao;
	}

	public void setCategoryDao(CategoryDao<TbCategory> categoryDao) {
		this.categoryDao = categoryDao;
	}

	
	public DataGrid findDataGrid(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();
		String hql = "select count(*) from TbCategory";

		int counts = Integer.parseInt(categoryDao.findUnique(hql).toString());

		hql = "from TbCategory";
		List<TbCategory> list = categoryDao.findList(hql, page, count);

		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);

		return dataGrid;
	}

	
	public boolean saveCategory(TbCategory tbCategory) throws Exception {

		String hql = "select count(*) from TbCategory where name = :name";

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("name", tbCategory.getName());

		int count = Integer.parseInt(categoryDao.findUnique(hql, map).toString());

		if (count == 0) {
			tbCategory.setCreatetime(new Timestamp(System.currentTimeMillis()));
			categoryDao.save(tbCategory);
			return true;
		}
		return false;
	}

	
	public int removeCategory(String ids) throws Exception {
		String[] sid = ids.split(",");

		int index = 0;
		for (String id : sid) {
			if (id != null && !"".equals(id.trim())) {
				String hql = "select count(*) from TbMedicine where categoryid = :id";
				Map<String, Object> map = new HashMap<String, Object>();

				map.put("id", Long.parseLong(id));

				Integer count = Integer.parseInt(medicineDao.findUnique(hql, map).toString());
				if (count == 0) {
					categoryDao.delete(new TbCategory(Long.parseLong(id)));
					index++;
				}
			}
		}
		return index;
	}

}
