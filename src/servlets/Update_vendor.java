package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Vendor;
import helper.Message;
import vendordao.VendorDao;

/**
 * Servlet implementation class Update_vendor
 */
public class Update_vendor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Update_vendor() {
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

		HttpSession s = request.getSession();
		Vendor vendor = (Vendor) s.getAttribute("current_vendor");

		String vendor_name = request.getParameter("vendor_name");
		String vendor_email = request.getParameter("vendor_email");
		String vendor_company = request.getParameter("vendor_company");
		String vendor_state = request.getParameter("vendor_state");
		String vendor_city = request.getParameter("vendor_city");
		Long vendor_pincode = Long.parseLong(request.getParameter("vendor_pincode"));
		Long vendor_gstnumber =Long.parseLong(request.getParameter("vendor_gstnumber"));
		Long vendor_mobile = Long.parseLong(request.getParameter("vendor_mobile"));

		vendor.setId(vendor.getId());
		vendor.setName(vendor_name);
		vendor.setEmail(vendor_email);
		vendor.setCity(vendor_city);
		vendor.setCompany(vendor_company);
		vendor.setState(vendor_state);

		vendor.setMobile(vendor_mobile);
		vendor.setGstnumber(vendor_gstnumber);
		vendor.setPincode(vendor_pincode);

		

		VendorDao vd = new VendorDao();
		if (vd.updateVendor(vendor)) {
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			Message message =new Message("Profile updated " , "success", "alert-success");
			HttpSession s1=request.getSession();
			s1.setAttribute("message", message);
			
			response.sendRedirect("vendor_home.jsp");
		}

		else {
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			Message message =new Message("Failed !!! Try again " , "success", "alert-success");
			HttpSession s1=request.getSession();
			s1.setAttribute("message", message);
			response.sendRedirect("vendor_profile_update.jsp");
		}

		doGet(request, response);
	}

}
