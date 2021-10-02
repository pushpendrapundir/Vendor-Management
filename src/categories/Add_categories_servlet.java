package categories;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vendordao.CategoryDao;

/**
 * Servlet implementation class Add_categories_servlet
 */
public class Add_categories_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add_categories_servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Integer vendor_id = Integer.parseInt( request.getParameter("vendor_id"));
		String category = request.getParameter("category");
		String cat_desc = request.getParameter("cat_desc");
		
		Category cat=new Category();
		cat.setCategory(category);
		cat.setCat_desc(cat_desc);
		cat.setVendor_id(vendor_id);
		
		CategoryDao cd=new CategoryDao();
		if(cd.saveCategory(cat))
		{
			response.sendRedirect("vendor_home.jsp");
		}
		else
		{
			response.sendRedirect("vendor_home.jsp");
		}

		
		doGet(request, response);
	}

}
