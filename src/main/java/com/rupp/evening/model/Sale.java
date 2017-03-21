package com.rupp.evening.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import com.rupp.evening.core.DBConnection;

public class Sale {
	private int id;
	private Date valueDate;
	private int userID;
	private java.sql.Date sqlDate;

	private static DBConnection db = new DBConnection();

	public Sale() {

	}

	public Sale(int id, Date valueDate, int userID) {
		this.id = id;
		this.valueDate = valueDate;
		this.userID = userID;
		this.sqlDate = new java.sql.Date(this.valueDate.getTime());
	}

	public int getSaleID() {
		return this.id;
	}

	public Date getValueDate() {
		return this.valueDate;
	}

	public int getUserID() {
		return this.userID;
	}

	public void save() {
		String sql = "INSERT INTO `sale` (`value_date`, `user_id`) " + "VALUES (?,?)";
		try {
			PreparedStatement prestmt = db.getPrepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			prestmt.setDate(1, sqlDate);
			prestmt.setInt(2, userID);
			prestmt.executeUpdate();
			ResultSet rs = prestmt.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
