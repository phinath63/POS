package com.rupp.evening.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.rupp.evening.core.DBConnection;

public class Scale {
	private int scaleID;
	private String scaleType;
	private static DBConnection db = new DBConnection();

	public Scale(){
		
	}
	public Scale(int scaleID,String scaleType) {
		this.scaleID = scaleID;
		this.scaleType = scaleType;

	}

	public int getscaleID() {
		return this.scaleID;
	}


	public String getScaleType() {
		return this.scaleType;
	}

	public static List<Scale> all() {
		String sql;
		List<Scale> rows = new ArrayList<Scale>();
		try {
			sql = "SELECT * FROM scale";
			ResultSet rs = db.getStatement().executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("scale_id");
				String type = rs.getString("scale_type");
				Scale scale = new Scale(id, type);
				rows.add(scale);
			}

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return rows;
	}

	public static Scale get(int scale_id) {
		String sql;
		Scale scale = null;
		try {
			sql = "SELECT * FROM scale where scale_id=" + scale_id;
			ResultSet rs = db.getStatement().executeQuery(sql);
			rs.first();
			int id = rs.getInt("scale_id");
			String type = rs.getString("scale_type");
			scale = new Scale(id,type);

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return scale;
	}

	public void save() {
		String sql = "INSERT INTO `scale` (`scale_id`, `scale_type`) " + "VALUES (?,?)";
		try {
			PreparedStatement prestmt = db.getPrepareStatement(sql);
			prestmt.setInt(1, scaleID);
			prestmt.setString(2, scaleType);
			prestmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void update() {
		String sql = "UPDATE scale SET scale_type=?  where scale_id=?";

		PreparedStatement prestmt = db.getPrepareStatement(sql);
		try {
			prestmt.setString(1, scaleType);
			prestmt.setInt(2, scaleID);
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
		String sql = "DELETE FROM Scale where scale_id=?";
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
