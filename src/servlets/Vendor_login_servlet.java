package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Vendor;
import helper.ConnectionProvider;
import helper.Message;
import vendordao.VendorDao;

/**
 * Servlet implementation class Vendor_login_servlet
 */
public class Vendor_login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vendor_login_servlet() {
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
		
		
		String vendor_email = request.getParameter("vendor_email");
		String vendor_password = request.getParameter("vendor_password");
		
		
		VendorDao vd=new VendorDao();
		
		Vendor vendor = vd.getVendorByEmailAndPassword(vendor_email, vendor_password);
		
		if(vendor==null)
		{
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			Message message =new Message("Something went to wrong ! try again" , "error", "alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("vendor_login.jsp");
		}
		else
		{
			
			
			
			HttpSession session=request.getSession();
			session.setAttribute("current_vendor", vendor);
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			Message message =new Message("WELCOME !!! "+vendor.getName().toUpperCase() , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("vendor_home.jsp");
					
		}
		
		
		
		doGet(request, response);
	}

}
