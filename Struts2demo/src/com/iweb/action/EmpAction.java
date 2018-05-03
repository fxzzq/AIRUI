package com.iweb.action;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.iweb.bean.Emp;
import com.iweb.dao.EmpDao;
import com.iweb.driven.EmpDriven;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 对emp数据的操作
 * 
 * @author jack
 *
 */
public class EmpAction extends BaseAction implements ModelDriven<EmpDriven> {

	private EmpDriven empDriven = new EmpDriven();

	public void getJobs() {

		// 查询数据Jobs
		EmpDao dao = new EmpDao();
		dao.init();

		List<String> jobs = dao.getJobs();

		dao.close();

		// 写回json

		writeJSON(jobs);

		// try {
		// PrintWriter pw = response.getWriter();
		//
		// pw.println(JSON.toJSONString(jobs));
		// pw.flush();
		// pw.close();
		//
		// } catch (IOException e) {
		// e.printStackTrace();
		// }

	}

	public void getMgrs() {

		EmpDao dao = new EmpDao();
		dao.init();

		Map<String, String> mgrs = dao.getMgrs();

		dao.close();

		writeJSON(mgrs);
	}

	/**
	 * 保存emp信息
	 * 
	 * @return
	 */
	public String insert() {

		try {
			EmpDao dao = new EmpDao();

			dao.init();

			Emp emp = new Emp();
			BeanUtils.copyProperties(emp, empDriven);
			emp.setHiredate(new Date());
			dao.save(emp);

			dao.close();
			// setPath("index");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return INDEX;
	}

	/**
	 * 删除emp
	 * 
	 * @return
	 */
	public String delete() {

		EmpDao dao = new EmpDao();

		dao.init();

		dao.delete(empDriven.getEmpno());

		dao.close();

		return INDEX;
	}
	
	/**
	 * 获取修改的信息
	 * @return
	 */
	public String getEmp(){
		
		EmpDao dao = new EmpDao();
		dao.init();
		Emp emp = dao.selectByPrimaryKey(empDriven.getEmpno());
		request.setAttribute("emp", emp);
		dao.close();
	
		setPath("update");
		return SUCCESS;
	}
	
	
	/**
	 * 更新数据
	 * @return
	 */
	public String update(){
		
		try {
			Emp emp = new Emp();
			BeanUtils.copyProperties(emp, empDriven);
			EmpDao dao = new EmpDao();
			dao.init();
			dao.update(emp);
			dao.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return INDEX;
	}

	@Override
	public EmpDriven getModel() {
		return empDriven;
	}

}
