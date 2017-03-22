package com.rupp.evening.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.rupp.evening.core.DBConnection;

public class User {
	private int userID;
	private String userName;
	private static DBConnection db = new DBConnection();

	public User(){
		
	}
	public User(int userID,String userName) {
		this.userID = userID;
		this.userName = userName;

	}

	public int getUserID() {
		return this.userID;
	}


	public String getUserName() {
		return this.userName;
	}

	public static List<User> all() {
		String sql;
		List<User> rows = new ArrayList<User>();
		try {
			sql = "SELECT * FROM User";
			ResultSet rs = db.getStatement().executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String type = rs.getString("user_name");
				User User = new User(id, type);
				rows.add(User);
			}

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return rows;
	}

	public static User get(int user_id) {
		String sql;
		User User = null;
		try {
			sql = "SELECT * FROM User where user_id=" + user_id;
			ResultSet rs = db.getStatement().executeQuery(sql);
			rs.first();
			int id = rs.getInt("user_id");
			String type = rs.getString("user_name");
			User = new User(id,type);

		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// db.closeConnection();
		}
		return User;
	}

//	public void save() {
//		String sql = "INSERT INTO `User` (`user_id`, `user_name`) " + "VALUES (?,?)";
//		try {
//			PreparedStatement prestmt = db.getPrepareStatement(sql);
//			prestmt.setInt(1, userID);
//			prestmt.setString(2, userName);
//			prestmt.executeUpdate();
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//	}
//
//	public void update() {
//		String sql = "UPDATE User SET user_name=?  where user_id=?";
//
//		PreparedStatement prestmt = db.getPrepareStatement(sql);
//		try {
//			prestmt.setString(1, userName);
//			prestmt.setInt(2, userID);
//			prestmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			// db.closeConnection();
//		}
//
//	}
//
//	public void delete(int id) {
//		DBConnection db = new DBConnection();
//		String sql = "DELETE FROM User where user_id=?";
//		try {
//			PreparedStatement prestmt = db.getPrepareStatement(sql);
//			prestmt.setInt(1, id);
//			prestmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		db.closeConnection();
//	}
}
