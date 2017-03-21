package com.rupp.evening.model;

import java.sql.PreparedStatement;
import com.rupp.evening.core.DBConnection;

public class SaleDetail {
	private int saleID;
	private int productMappingID;
	private int qty;
	private double price;

	private static DBConnection db = new DBConnection();

	public SaleDetail() {

	}

	public SaleDetail(int saleID, int productMappingID, int qty, double price) {
		this.saleID = saleID;
		this.productMappingID = productMappingID;
		this.qty = qty;
		this.price = price;
	}

	public int getSaleID() {
		return this.saleID;
	}

	public int getProductMappingID() {
		return this.productMappingID;
	}

	public int getQuantity() {
		return this.qty;
	}

	public double getPricce() {
		return this.price;
	}

	public void save() {
		String sql = "INSERT INTO `sale_detail` (`sale_id`, `product_mapping_id`, `sale_quantity`, `sale_price`) VALUES (?,?,?,?)";
		try {
			PreparedStatement prestmt = db.getPrepareStatement(sql);
			prestmt.setInt(1, saleID);
			prestmt.setInt(2, productMappingID);
			prestmt.setInt(3, qty);
			prestmt.setDouble(4, price);
			prestmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
