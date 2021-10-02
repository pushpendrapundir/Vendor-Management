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
 * Servlet implementation class Buyer_login_servlet
 */
public class Buyer_login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buyer_login_servlet() {
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
		

		String buyer_email = request.getParameter("buyer_email");
		String buyer_password = request.getParameter("buyer_password");
		
		
		BuyerDao bd=new BuyerDao();
		
		Buyer buyer = bd.getBuyerByEmailAndPassword(buyer_email, buyer_password);
		
		if(buyer==null)
		{try {
			Thread.sleep(2000);
		} catch (Exception e) {
			// TODO: handle exception
		}
		

		Message message =new Message("Something went to wrong ! try again" , "error", "alert-danger");
		HttpSession s=request.getSession();
		s.setAttribute("message", message);
			response.sendRedirect("buyer_login.jsp");
		}
		else
		{
			try {
				Thread.sleep(2000);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			HttpSession session=request.getSession();
			session.setAttribute("current_buyer", buyer);
			Message message =new Message("WELCOME !!! "+buyer.getName().toUpperCase()  , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("buyer_home.jsp");
					
		}
		
		
		doGet(request, response);
	}

}
