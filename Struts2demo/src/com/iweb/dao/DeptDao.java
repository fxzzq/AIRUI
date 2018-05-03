package com.iweb.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iweb.bean.Dept;

public class DeptDao extends DB<Dept> {

	@Override
	public List<Dept> selectList() {
		String sql = "select * from dept";
		List<Dept> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			Dept d = null;

			while (rs.next()) {
				d = new Dept();
				d.setDeptno(rs.getInt("deptno"));
				d.setDname(rs.getString("dname"));
				d.setLoc(rs.getString("loc"));
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Dept selectByPrimaryKey(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(Dept t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Dept t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Serializable id) {
		// TODO Auto-generated method stub

	}

}
