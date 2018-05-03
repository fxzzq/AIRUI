package com.iweb.dao;

import java.io.Serializable;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.iweb.bean.Emp;

public class EmpDao extends DB<Emp> {

	@Override
	public List<Emp> selectList() {
		List<Emp> set = new ArrayList<>();
		try {
			pst = conn.prepareStatement("SELECT * FROM  emp");
			rs = pst.executeQuery();
			foreachdata(set);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return set.size() > 0 ? set : null;
	}

	@Override
	public Emp selectByPrimaryKey(Serializable id) {

		Emp emp = null;
		try {
			pst = conn.prepareStatement("select * from emp where empno = ?");

			pst.setObject(1, id);
			rs = pst.executeQuery();
			emp = rs.next()
					? new Emp(rs.getInt("empno"), rs.getString("ename"), rs.getString("job"), rs.getInt("mgr"),
							rs.getDate("hiredate"), rs.getDouble("sal"), rs.getDouble("comm"), rs.getInt("deptno"))
					: null;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return emp;
	}

	@Override
	public void save(Emp emp) {
		try {
			String sql = "INSERT  INTO  emp VALUES (?,?,?,?,?,?,?,?)";

			// 设置主键
			pst = conn.prepareStatement("select max(empno) empno from emp");
			rs = pst.executeQuery();
			int id = 0;
			while (rs.next()) {
				id = rs.getInt("empno") + 1;
			}
			emp.setEmpno(id);

			pst = conn.prepareStatement(sql);
			pst.setInt(1, emp.getEmpno());
			pst.setString(2, emp.getEname());
			pst.setString(3, emp.getJob());
			pst.setInt(4, emp.getMgr());
			pst.setDate(5, new Date(emp.getHiredate().getTime()));
			pst.setDouble(6, emp.getSal());
			pst.setDouble(7, emp.getComm());
			pst.setInt(8, emp.getDeptno());
			pst.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void update(Emp emp) {
		try {
			// 根据传进来的这个数据去查询数据库的数据

			Emp e = selectByPrimaryKey(emp.getEmpno());

			// 在对查询出来的数据进行补全
			BeanUtils.copyProperty(emp, "hiredate", e.getHiredate());

			String sql = "update emp set ename=?,job=?,mgr=?,hiredate=?,sal=?,comm=?,Deptno=? where empno=?";

			pst = conn.prepareStatement(sql);
			pst.setString(1, emp.getEname());
			pst.setString(2, emp.getJob());
			pst.setInt(3, emp.getMgr());
			pst.setDate(4, new Date(emp.getHiredate().getTime()));
			pst.setDouble(5, emp.getSal());
			pst.setDouble(6, emp.getComm());
			pst.setInt(7, emp.getDeptno());
			pst.setInt(8, emp.getEmpno());
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void delete(Serializable id) {
		try {
			pst = conn.prepareStatement("DELETE FROM emp where empno =?");
			pst.setObject(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private void foreachdata(List<Emp> set) throws Exception {
		Emp e;
		while (rs.next()) {
			e = new Emp();
			e.setEmpno(rs.getInt("empno"));
			e.setEname(rs.getString("ename"));
			e.setJob(rs.getString("job"));
			e.setMgr(rs.getInt("mgr"));
			e.setHiredate(rs.getDate("hiredate"));
			e.setSal(rs.getDouble("sal"));
			e.setComm(rs.getDouble("comm"));
			e.setDeptno(rs.getInt("deptno"));
			set.add(e);
		}

	}

	public List<String> getJobs() {
		List<String> jobs = new ArrayList<>();
		String sql = "select distinct job from emp ";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				jobs.add(rs.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return jobs;

	}

	public Map<String, String> getMgrs() {
		Map<String, String> map = new HashMap<>();
		String sql = "select distinct mgr from emp where mgr is not null";

		// 建立规则库
		List<Emp> list = selectList();

		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getEmpno() + "", list.get(i).getEname());
		}

		Map<String, String> remap = new HashMap<>();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String key = rs.getInt(1) + "";
				remap.put(key, map.get(key));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return remap;
	}
}
