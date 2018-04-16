package com.mxp.service;

import com.mxp.entity.TbCategory;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public interface CategorySercie {

	DataGrid findDataGrid(Page page) throws Exception;

	boolean saveCategory(TbCategory tbCategory)throws Exception;

	int removeCategory(String ids)throws Exception;

}
