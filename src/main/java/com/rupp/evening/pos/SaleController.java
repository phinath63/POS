package com.rupp.evening.pos;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rupp.evening.model.ProductMapping;
import com.rupp.evening.model.Sale;
import com.rupp.evening.model.SaleDetail;

public class SaleController extends HttpServlet {
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
		Sale sale;
		SaleDetail sd = null;
		if (session != null && session.getAttribute("user") != null) {
			String type = request.getParameter("type");
			switch (type) {
			case "getAll":
				break;
			case "get":
				break;
			case "add":
				sale = new Sale(0, new Date(), 1);
				sale.save();
				String[] products = request.getParameterValues("product-mapping-id");
				String[] prices = request.getParameterValues("price");
				String[] qtys = request.getParameterValues("qty");
				for (int i = 0; i < products.length; i++) {
					int product = Integer.parseInt(products[i]);
					double price = Double.parseDouble(prices[i]);
					int qty = Integer.parseInt(qtys[i]);
					sd = new SaleDetail(sale.getSaleID(), product, qty, price);
					sd.save();
				}
				break;
			case "edit":
				break;
			case "delete":
				break;
			default:
				request.setAttribute("products", ProductMapping.all());
				request.getRequestDispatcher("sale.jsp").forward(request, response);
				break;
			}
		} else {
			response.sendRedirect("login.jsp");
		}

	}

	@Override
	public void destroy() {
		System.out.println("=====destroy method is called====");
	}

}
