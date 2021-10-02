package servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import entities.Product;
import helper.Message;
import vendordao.ProductDao;

/**
 * Servlet implementation class AddProductServlet
 */

@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		Part part = request.getPart("product_picture");
		String product_picture = part.getSubmittedFileName();
		
		String product_name = request.getParameter("product_name");
		String product_desc = request.getParameter("product_desc");
		String product_cat = request.getParameter("product_cat");
		
		float product_price = Float.parseFloat( request.getParameter("product_price"));
		Integer vendor_id =Integer.parseInt( request.getParameter("vendor_id"));
		
		Product product= new Product(product_price, vendor_id, product_name, product_picture, product_cat, product_desc);
		
		ProductDao pd=new ProductDao();
		if(pd.saveproduct(product))
		{
			
			//sace post pic 
			String path=request.getRealPath("/"+"product_images"+File.separator+ product.getProduct_picture());
			//Helper.deleteFile(path);
			
			boolean saveFile = helper.Helper.saveFile(part.getInputStream(), path);
			
			if(saveFile)
			{
				System.out.println("file is saved");
			}
			try {
				Thread.sleep(2000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			Message message =new Message("Product is added " , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("vendor_home.jsp");
			
			
			
		}
		else
		{
			try {
				Thread.sleep(2000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			Message message =new Message("Failed !!! Product is not added" , "error", "alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("vendor_home.jsp");
		}
		
	
		
		
		
		
		
		doGet(request, response);
	}

}
