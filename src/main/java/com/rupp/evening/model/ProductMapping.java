package com.rupp.evening.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.rupp.evening.core.DBConnection;

public class ProductMapping {
	private int productMappingID, productID, scaleID, mapdependancyID, scaleQuantity;
	private double scalePrice;
	/*
	 * product mapping detail
	 */

	private String code, productName, scaleType, dependancyType;
	private static DBConnection db = new DBConnection();

	public ProductMapping() {

	}

	public ProductMapping(int id, String code, int productID, int scaleID, int mapdependancyID, int scaleQuantity,
			double scalePrice) {
		this.productMappingID = id;
		this.code = code;
		this.productID = productID;
		this.scaleID = scaleID;
		this.mapdependancyID = mapdependancyID;
		this.scaleQuantity = scaleQuantity;
		this.scalePrice = scalePrice;

	}

	public ProductMapping(int id, int productID, String code, String productName, int scaleID, String scaleType,
			int mapdependancyID, String dependancyType, int scaleQuantity, double scalePrice) {
		this.productMappingID = id;
		this.productID = productID;
		this.code = code;
		this.productName = productName;
		this.scaleID = scaleID;
		this.scaleType = scaleType;
		this.mapdependancyID = mapdependancyID;
		this.dependancyType = dependancyType;
		this.scaleQuantity = scaleQuantity;
		this.scalePrice = scalePrice;
	}

	public int getProductMappingID() {
		return this.productMappingID;
	}

	public int getProductID() {
		return this.productID;
	}

	public String getCode() {
		return this.code;
	}

	public String getProductName() {
		return this.productName;
	}

	public int getScaleID() {
		return this.scaleID;
	}

	public String getScaleType() {
		return this.scaleType;
	}

	public int getMapdependancyID() {
		return this.mapdependancyID;
	}

	public String getDependancyType() {
		return this.dependancyType;
	}

	public int getScaleQuantity() {
		return this.scaleQuantity;
	}

	public double getScalePrice() {
		return this.scalePrice;
	}

	public static List<ProductMapping> all() {
		String sql;
		List<ProductMapping> rows = new ArrayList<ProductMapping>();
		try {
			sql = "SELECT * FROM product_detail";
			ResultSet rs = db.getStatement().executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("product_map_id");
				int productID = rs.getInt("product_id");
				String code = rs.getString("code");
				String productName = rs.getString("product_name");
				int scaleID = rs.getInt("scale_id");
				String scaleType = rs.getString("scale_type");
				int mapDependancyID = rs.getInt("map_dependancy_id");
				String dependancyType = rs.getString("dependancy_type");
				int quantity = rs.getInt("scale_quantity");
				double price = rs.getDouble("scale_price");
				ProductMapping pro = new ProductMapping(id, productID, code, productName, scaleID, scaleType,
						mapDependancyID, dependancyType, quantity, price);
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

	public static ProductMapping get(int mappingID) {
		String sql;
		ProductMapping mapping = null;
		try {
			sql = "SELECT * FROM product_detail where product_map_id=" + mappingID;
			ResultSet rs = db.getStatement().executeQuery(sql);
			if(rs.first()){
				int id = rs.getInt("product_map_id");
				int productID = rs.getInt("product_id");
				String code = rs.getString("code");
				String productName = rs.getString("product_name");
				int scaleID = rs.getInt("scale_id");
				String scaleType = rs.getString("scale_type");
				int mapDependancyID = rs.getInt("map_dependancy_id");
				String dependancyType = rs.getString("dependancy_type");
				int quantity = rs.getInt("scale_quantity");
				double price = rs.getDouble("scale_price");
				mapping = new ProductMapping(id, productID, code, productName, scaleID, scaleType, mapDependancyID,
						dependancyType, quantity, price);
			}
			
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return mapping;
	}

	public void save() {
		String sql = "INSERT INTO `product_mapping` (`code`, `product_id`, `scale_id`, `map_dependancy_id`, `scale_quantity`, `scale_price`) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement prestmt = db.getPrepareStatement(sql);
			prestmt.setString(1, code);
			prestmt.setInt(2, productID);
			prestmt.setInt(3, scaleID);
			prestmt.setInt(4, mapdependancyID);
			prestmt.setInt(5, scaleQuantity);
			prestmt.setDouble(6, scalePrice);
			prestmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void update() {
		String sql = "UPDATE product_mapping SET code=?, product_id=?, scale_id=?, map_dependancy_id=?, scale_quantity=?,scale_price=?  where product_map_id=?";

		PreparedStatement prestmt = db.getPrepareStatement(sql);
		try {
			prestmt.setString(1, code);
			prestmt.setInt(2, productID);
			prestmt.setInt(3, scaleID);
			prestmt.setInt(4, mapdependancyID);
			prestmt.setInt(5, scaleQuantity);
			prestmt.setDouble(6, scalePrice);
			prestmt.setInt(7, productMappingID);
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
		String sql = "DELETE FROM product_mapping where product_map_id=?";
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
