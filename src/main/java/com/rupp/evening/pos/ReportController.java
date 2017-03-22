package com.rupp.evening.pos;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rupp.evening.model.Product;
import com.rupp.evening.model.Scale;
import com.rupp.evening.model.User;

//import com.rupp.evening.model.ProductMapping;

public class ReportController extends HttpServlet {
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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("scales", Scale.all());
			request.setAttribute("products", Product.all());
			request.setAttribute("users", User.all());
			//request.setAttribute("rows", Report.all());
			request.getRequestDispatcher("report.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}

	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
