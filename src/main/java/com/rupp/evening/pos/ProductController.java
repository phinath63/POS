package com.rupp.evening.pos;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import com.rupp.evening.model.Product;

//import com.rupp.evening.model.Product;

public class ProductController extends HttpServlet {
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
		HttpSession session = request.getSession(false);
		int id;
		String code;
		String name;
		Product pro;
		if (session != null && session.getAttribute("user") != null) {
			String type = request.getParameter("type");
			switch (type) {
			case "getAll":
				request.setAttribute("rows", Product.all());
				request.getRequestDispatcher("product.jsp").forward(request, response);
				break;
			case "get":
				ObjectMapper mapperObj = new ObjectMapper();
				String jsonStr = mapperObj
						.writeValueAsString(Product.get(Integer.parseInt(request.getParameter("id"))));
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				break;
			case "add":
				code = request.getParameter("code");
				name = request.getParameter("name");
				pro = new Product(0, code, name);
				pro.save();
				break;
			case "edit":
				id = Integer.parseInt(request.getParameter("id"));
				code = request.getParameter("code");
				name = request.getParameter("name");
				pro = new Product(id, code, name);
				pro.update();
				break;
			case "delete":
				id = Integer.parseInt(request.getParameter("id"));
				pro = new Product();
				pro.delete(id);
				break;
			default:
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