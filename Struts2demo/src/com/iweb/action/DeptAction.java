package com.iweb.action;

import java.util.List;

import com.iweb.bean.Dept;
import com.iweb.dao.DeptDao;

/**
 * 对部门的操作
 * @author jack
 *
 */
public class DeptAction extends BaseAction {
	
	public void getDeptnos(){
		
		DeptDao dao = new DeptDao();
		
		dao.init();
		
		List<Dept> list = dao.selectList();
		
		dao.close();
		
		writeJSON(list);
		
	}

}
