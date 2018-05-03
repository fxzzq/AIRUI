package com.iweb.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public abstract class DB<T> {

	protected Connection conn;

	protected PreparedStatement pst;
	protected ResultSet rs;

	public void init() {

		try {
			String url = "jdbc:oracle:thin:@192.168.203.134:1521:orcl";
			String driver = "oracle.jdbc.driver.OracleDriver";// 包路径
			String username = "scott";
			String password = "123456";

			Class.forName(driver);// 加载驱动
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public abstract List<T> selectList();

	public abstract T selectByPrimaryKey(Serializable id);

	public abstract void save(T t);

	public abstract void update(T t);

	public abstract void delete(Serializable id);

	public void close() {
		
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
