package com.rupp.evening.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/posdb";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "phinath";
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement preStmt = null;
	private ResultSet rs = null;

	public DBConnection() {
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("Register Dirver successfully");
			this.conn = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Connecting to database...");
			this.stmt = conn.createStatement();
			System.out.println("Statement is now created...");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public Connection getConnection() {
		return this.conn;
	}

	public Statement getStatement() {
		return this.stmt;
	}

	public PreparedStatement getPrepareStatement(String sql, int option) {
		try {
			preStmt = conn.prepareStatement(sql, option);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in updating record...");
			e.printStackTrace();
		}
		return preStmt;
	}

	public PreparedStatement getPrepareStatement(String sql) {

		try {
			preStmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in updating record...");
			e.printStackTrace();
		}
		return preStmt;
	}

	public int delete(String sql) {
		int result = 0;
		try {
			preStmt = conn.prepareStatement(sql);
			result = preStmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in updating record...");
			e.printStackTrace();
		}
		return result;
	}

	public void closeConnection() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (preStmt != null) {
				preStmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
