package com.rupp.evening.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.rupp.evening.core.DBConnection;

public class Product {
	private int productID;
	private String productCode, productName;
	private static DBConnection db = new DBConnection();

	public Product(){
		
	}
	public Product(int productID, String productCode, String productName) {
		this.productID = productID;
		this.productCode = productCode;
		this.productName = productName;

	}

	public int getProductID() {
		return this.productID;
	}

	public String getProductCode() {
		return this.productCode;
	}

	public String getProductName() {
		return this.productName;
	}

	public static List<Product> all() {
		String sql;
		List<Product> rows = new ArrayList<Product>();
		try {
			sql = "SELECT * FROM product";
			ResultSet rs = db.getStatement().executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("product_id");
				// System.out.println(id);
				String code = rs.getString("product_code");
				String name = rs.getString("product_name");
				Product pro = new Product(id, code, name);
				rows.add(pro);
			}

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return rows;
	}

	public static Product get(int pro_id) {
		String sql;
		Product pro = null;
		try {
			sql = "SELECT * FROM product where product_id=" + pro_id;
			ResultSet rs = db.getStatement().executeQuery(sql);
			rs.first();
			int id = rs.getInt("product_id");
			String code = rs.getString("product_code");
			String name = rs.getString("product_name");
			pro = new Product(id, code, name);

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return pro;
	}

	public void save() {
		String sql = "INSERT INTO `product` (`product_code`, `product_name`) " + "VALUES (?,?)";
		try {
			PreparedStatement prestmt = db.getPrepareStatement(sql);
			prestmt.setString(1, productCode);
			prestmt.setString(2, productName);
			prestmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void update() {
		String sql = "UPDATE product SET product_code=?,product_name=?" + " where product_id=?";

		PreparedStatement prestmt = db.getPrepareStatement(sql);
		try {
			prestmt.setString(1, productCode);
			prestmt.setString(2, productName);
			prestmt.setInt(3, productID);
			prestmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}

	}

	public void delete(int id) {
		DBConnection db = new DBConnection();
		String sql = "DELETE FROM product where product_id=?";
		try {
			PreparedStatement prestmt = db.getPrepareStatement(sql);
			prestmt.setInt(1, id);
			prestmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		db.closeConnection();
	}
}
