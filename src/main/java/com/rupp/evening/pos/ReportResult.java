package com.rupp.evening.pos;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rupp.evening.model.Report;

//import com.rupp.evening.model.ProductMapping;

public class ReportResult extends HttpServlet {
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
			String conditions = "";
			if (!request.getParameter("trn-from").equals("")) {
				String valueDate = request.getParameter("trn-from");
				conditions += " AND value_date>=\"" + valueDate + "\" ";
			}
			if (!request.getParameter("trn-till").equals("")) {
				String valueDate = request.getParameter("trn-till");
				conditions += " AND value_date<=\"" + valueDate + "\" ";
			}
			if (!request.getParameter("product-id").equals("")) {
				conditions += " AND product_id=" + request.getParameter("product-id");
				;
			}
			if (!request.getParameter("scale-id").equals("")) {
				conditions += " AND scale_id=" + request.getParameter("scale-id");
			}
			if (!request.getParameter("user-id").equals("")) {
				conditions += " AND user_id=" + request.getParameter("user-id");
			}
			System.out.println(conditions);
			request.setAttribute("rows", Report.all(conditions));
			request.getRequestDispatcher("report-result.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}

	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
