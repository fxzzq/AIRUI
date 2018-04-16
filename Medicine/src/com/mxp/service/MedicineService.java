package com.mxp.service;

import java.util.List;

import com.mxp.entity.TbCategory;
import com.mxp.entity.TbMedicine;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public interface MedicineService {
	
	
	public DataGrid findDataGrid(Page page)throws Exception;
	
	public List<TbCategory> getCategory()throws Exception;
	
	public boolean saveMedicine(TbMedicine tbMedicine) throws Exception;
	
	public TbMedicine getUpdateEntity(Long id)throws Exception;

	public boolean updateMedicine(TbMedicine tbMedicine)throws Exception;

	public boolean removeMedicine(String ids)throws Exception;

	public boolean modifyStock(TbMedicine tbMedicine)throws Exception;

}
