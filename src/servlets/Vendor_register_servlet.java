package servlets;

import java.io.IOException;
import java.sql.Connection;

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
 * Servlet implementation class Vendor_register_servlet
 */
public class Vendor_register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Vendor_register_servlet() {
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

		String vendor_name = request.getParameter("vendor_name");
		String vendor_email = request.getParameter("vendor_email");
		String vendor_password = request.getParameter("vendor_password");
		String vendor_cpassword = request.getParameter("vendor_cpassword");

		Vendor vendor = new Vendor(vendor_name, vendor_email, vendor_password);

		if (vendor_cpassword.equals(vendor_password)) {

			VendorDao vd = new VendorDao();
			if (vd.saveVendor(vendor)) {
				try {
					Thread.sleep(1000);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				Message message =new Message("Registration Successfully ! Now you can Login" , "success", "alert-success");
				HttpSession s=request.getSession();
				s.setAttribute("message", message);
				response.sendRedirect("vendor_login.jsp");
			}

			else {
				try {
					Thread.sleep(1000);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				
				Message message =new Message("Something went to wrong ! try again" , "error", "alert-danger");
				HttpSession s=request.getSession();
				s.setAttribute("message", message);
				
				
				
				response.sendRedirect("vendor_registration.jsp");
			}

		} else {
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			Message message =new Message("Something went to wrong ! try again" , "error", "alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			
			
			response.sendRedirect("vendor_registration.jsp");

		}

		doGet(request, response);
	}

}
