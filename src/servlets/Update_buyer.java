package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Buyer;
import helper.Message;
import vendordao.BuyerDao;


/**
 * Servlet implementation class Update_buyer
 */
public class Update_buyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_buyer() {
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
		
		
		

		HttpSession s = request.getSession();
		Buyer buyer = (Buyer) s.getAttribute("current_buyer");

		String buyer_name = request.getParameter("buyer_name");
		String buyer_email = request.getParameter("buyer_email");
		String buyer_company = request.getParameter("buyer_company");
		String buyer_state = request.getParameter("buyer_state");
		String buyer_city = request.getParameter("buyer_city");
		Long buyer_pincode = Long.parseLong(request.getParameter("buyer_pincode"));
		Long buyer_gstnumber =Long.parseLong(request.getParameter("buyer_gstnumber"));
		Long buyer_mobile = Long.parseLong(request.getParameter("buyer_mobile"));

		buyer.setId(buyer.getId());
		buyer.setName(buyer_name);
		buyer.setEmail(buyer_email);
		buyer.setCity(buyer_city);
		buyer.setCompany(buyer_company);
		buyer.setState(buyer_state);

		buyer.setMobile(buyer_mobile);
		buyer.setGstnumber(buyer_gstnumber);
		buyer.setPincode(buyer_pincode);

		

		BuyerDao bd = new BuyerDao();
		if (bd.updatebuyer(buyer)) {
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			Message message =new Message("Profile updated " , "success", "alert-success");
			HttpSession s1 =request.getSession();
			s1.setAttribute("message", message);
			response.sendRedirect("buyer_home.jsp");
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
			response.sendRedirect("buyer_profile_update.jsp");
		}
		doGet(request, response);
	}

}
