package com.rupp.evening.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.rupp.evening.core.DBConnection;

public class Report {
	private int saleID;
	private Date date;
	private int userID;
	private String userName;
	private int productMapID;
	private double salePrice;
	private int saleQuantity;
	private String code;
	private int productID;
	private String productCode;
	private String productName;
	private int scaleID;
	private String scaleType;
	private int dependancyID;
	private String dependancyType;
	private int scaleQuantity;
	private double scalePrice;

	private static DBConnection db = new DBConnection();

	public Report() {

	}

	public Report(int saleID, Date date, int userID, String userName, int productMapID, double salePrice,
			int saleQuantity, String code, int productID, String productCode, String productName, int scaleID,
			String scaleType, int dependancyID, String dependancyType, int scaleQuantity, double scalePrice) {
		this.saleID = saleID;
		this.date = date;
		this.userID = userID;
		this.userName = userName;
		this.productMapID = productMapID;
		this.salePrice = salePrice;
		this.saleQuantity = saleQuantity;
		this.code = code;
		this.productID = productID;
		this.productCode = productCode;
		this.productName = productName;
		this.scaleID = scaleID;
		this.scaleType = scaleType;
		this.dependancyType = dependancyType;
		this.scaleQuantity = scaleQuantity;
		this.scalePrice = scalePrice;

	}

	public Date getValueDate() {
		return date;
	}
	
	public String getProductName() {
		return productName;
	}
	public String getScaleType() {
		return scaleType;
	}
	public int getSaleQuantity() {
		return saleQuantity;
	}
	public double getSalePrice() {
		return salePrice;
	}
	public double getScalePrice() {
		return scalePrice;
	}
	public String getUserName() {
		return userName;
	}

	public static List<Report> all(String conditions) {
		String sql;
		List<Report> rows = new ArrayList<Report>();
		try {
			sql = "SELECT * FROM sale_report where `default`=1"+conditions;
			ResultSet rs = db.getStatement().executeQuery(sql);
			while (rs.next()) {
				int saleID = rs.getInt("sale_id");
				Date date = rs.getDate("value_date");
				int userID = rs.getInt("user_id");
				String userName = rs.getString("user_name");
				int productMapID = rs.getInt("product_mapping_id");
				double salePrice = rs.getDouble("sale_price");
				int saleQuantity = rs.getInt("sale_quantity");
				String code = rs.getString("code");
				int productID = rs.getInt("product_id");
				String productCode = rs.getString("product_code");
				String productName = rs.getString("product_name");
				int scaleID = rs.getInt("scale_id");
				String scaleType = rs.getString("scale_type");
				int dependancyID = rs.getInt("map_dependancy_id");
				String dependancyType = rs.getString("dependancy_type");
				int scaleQuantity = rs.getInt("scale_quantity");
				double scalePrice = rs.getDouble("scale_price");
				Report report = new Report(saleID, date, userID, userName, productMapID, salePrice, saleQuantity, code,
						productID, productCode, productName, scaleID, scaleType, dependancyID, dependancyType,
						scaleQuantity, scalePrice);
				rows.add(report);
			}

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return rows;
	}
}
