package com.rupp.evening.pos;
/**
 * 
 */

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rupp.evening.core.*;

/**

 */
public class Login extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// resource

	@Override
	public void init() throws ServletException {
		System.out.println("=====init method is called====");
		// populate initialize resources
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		DBConnection db = new DBConnection();
		String sql = "select * from user where user_name=? and password=?";
		PreparedStatement stmt = db.getPrepareStatement(sql);
		try {
			stmt.setString(1, userName);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				request.getSession(true).setAttribute("user", userName);
			} else {
				System.out.println("Fail");
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
