package com.mxp.service;

import com.mxp.entity.TbUser;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public interface SystemService {

	public DataGrid findDataGrid(Page page) throws Exception;

	public boolean addmanager(TbUser tbUser) throws Exception;

	public int removeManager(String ids) throws Exception;

	public TbUser getManager(Long id) throws Exception;

	public boolean updatemanager(TbUser tbUser)throws Exception;

	public boolean checkUsername(TbUser tbUser) throws Exception;

	public boolean repair()throws Exception;

}
