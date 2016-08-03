package com.bap.comn;

import java.sql.*;
import java.util.*;

public class MySQLHelper {
	String driver = "com.mysql.jdbc.Driver";//定义数据库驱动程序
	String url = "jdbc:mysql://127.0.0.1:3306/db_fee";//数据库连接地址
	String user = "root";//数据库连接用户名
	String passwd = "123456";//数据库连接密码
	Connection conn = null;//数据库连接对象
	ResultSet rs = null;//数据库结果集
	Statement st = null;//数据库操作

	public MySQLHelper() {
		try {
			Class.forName(driver);//数据库驱动程序加载
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static String GetGlobalUniqueID() {
		return new Long(Calendar.getInstance().getTimeInMillis()).toString();
	}

	// in order to update and insert operation
	public int Update(String sql) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(url, user, passwd);
			if(conn==null) System.out.print("aa");
			st = conn.createStatement();
			result = st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.print("bb");
			e.printStackTrace();
		}
		return result;//指示受影响的行数（即更新计数）
	}

	// in order to select operation
	public ResultSet Query(String sql) {
		try {
			conn = DriverManager.getConnection(url, user, passwd);
			if(conn==null) System.out.print("aa");
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// in order to delete operation
	public int Delete(String sql) {
		int DelResult = 0;
		try {
			conn = DriverManager.getConnection(url, user, passwd);
			st = conn.createStatement();
			DelResult = st.executeUpdate(sql);//指示受影响的行数
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return DelResult;
	}

	// in order to insert operation
		public int Insert(String sql) {
			int DelResult = 0;
			try {
				conn = DriverManager.getConnection(url, user, passwd);
				st = conn.createStatement();
				DelResult = st.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return DelResult;
		}
	// in order to close with database
	public void Close() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}