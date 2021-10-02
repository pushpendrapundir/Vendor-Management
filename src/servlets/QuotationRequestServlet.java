package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.QuotationRequest;
import helper.Message;
import vendordao.QuotationDao;

/**
 * Servlet implementation class QuotationRequestServlet
 */
public class QuotationRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuotationRequestServlet() {
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
		try {
			Thread.sleep(4000);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		int product_id =Integer.parseInt( request.getParameter("product_id"));
		int vendor_id =Integer.parseInt( request.getParameter("vendor_id"));
		int buyer_id =Integer.parseInt( request.getParameter("buyer_id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		String message1 = request.getParameter("message");
		
		QuotationRequest quotationRequest=new QuotationRequest(vendor_id, buyer_id, product_id, quantity, "request", message1);
//		System.out.println(quotationRequest);
		
		
		QuotationDao quotationDao=new QuotationDao();
		if(quotationDao.saveQuotationRequest(quotationRequest))
		{
			Message message =new Message("Quotation request sent " , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			
			
			response.sendRedirect("buyer_home.jsp");
		}
		
		else
		{
			Message message =new Message("Quotation request failed !!! Try again" , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("product_detailes.jsp?id="+product_id+"&id1="+buyer_id);
		}
		
		
		
		
		
		
		
		
		
		doGet(request, response);
	}

}
