package com.rupp.evening.pos;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import com.rupp.evening.model.ProductMapping;
import com.rupp.evening.model.Scale;
import com.rupp.evening.model.Product;

//import com.rupp.evening.model.Product;

public class ProductMappingController extends HttpServlet {
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
		ProductMapping pm;
		int productMappingID, productID, scaleID, mapdependancyID, scaleQuantity;
		double scalePrice;
		String code;
		// if (true) {
		if (session != null && session.getAttribute("user") != null) {
			String type = request.getParameter("type");
			switch (type) {
			case "getAll":
				request.setAttribute("rows", ProductMapping.all());
				request.setAttribute("products", Product.all());
				request.setAttribute("scales", Scale.all());
				request.getRequestDispatcher("product-mapping.jsp").forward(request, response);
				break;
			case "get":
				ObjectMapper mapperObj = new ObjectMapper();
				String jsonStr = mapperObj
						.writeValueAsString(ProductMapping.get(Integer.parseInt(request.getParameter("id"))));
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				break;
			case "add":
				code = request.getParameter("code");
				productID = Integer.parseInt(request.getParameter("product-id"));
				scaleID = Integer.parseInt(request.getParameter("scale-id"));
				mapdependancyID = request.getParameter("map-dependancy-id").equals("") ? 0
						: Integer.parseInt(request.getParameter("map-dependancy-id"));

				scaleQuantity = Integer.parseInt(request.getParameter("quantity"));
				scalePrice = Double.parseDouble(request.getParameter("price"));
				pm = new ProductMapping(0, code, productID, scaleID, mapdependancyID, scaleQuantity, scalePrice);
				pm.save();
				break;
			case "edit":
				productMappingID = Integer.parseInt(request.getParameter("id"));
				code = request.getParameter("code");
				productID = Integer.parseInt(request.getParameter("product-id"));
				scaleID = Integer.parseInt(request.getParameter("scale-id"));
				mapdependancyID = request.getParameter("map-dependancy-id").equals("") ? 0
						: Integer.parseInt(request.getParameter("map-dependancy-id"));

				scaleQuantity = Integer.parseInt(request.getParameter("quantity"));
				scalePrice = Double.parseDouble(request.getParameter("price"));
				pm = new ProductMapping(productMappingID, code, productID, scaleID, mapdependancyID, scaleQuantity,
						scalePrice);
				pm.update();
				break;
			case "delete":
				productMappingID = Integer.parseInt(request.getParameter("id"));
				pm = new ProductMapping();
				pm.delete(productMappingID);
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