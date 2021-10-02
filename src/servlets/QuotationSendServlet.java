package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.QuotationSend;
import helper.Message;
import vendordao.QuotationDao;

/**
 * Servlet implementation class QuotationSendServlet
 */
public class QuotationSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuotationSendServlet() {
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
		
		//Date operations
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Date issue_date=new Date(System.currentTimeMillis());
		Date current_date = new Date(System.currentTimeMillis());
		c.setTime(current_date);
		c.add(Calendar.DAY_OF_MONTH, 3);  
		String dateAfterThreeDays = sdf.format(c.getTime());  
		String startDate=dateAfterThreeDays;
		java.util.Date date = null;
		try {
			date = sdf.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date valid_Date = new java.sql.Date(date.getTime());
		
		
		/* servlet operation */
		
		int quotation_id = Integer.parseInt(request.getParameter("quotation_id"));
		Integer wholesale_price = Integer.parseInt(request.getParameter("wholesale_price"));
		
		QuotationSend quotationSend=new QuotationSend(quotation_id,wholesale_price, "quotationSend", issue_date, valid_Date);
		
		QuotationDao qd=new QuotationDao();
		if(qd.saveSendQuotation(quotationSend))
		{
			
			Message message =new Message("Quotation sent to the buyer " , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("vendor_home.jsp");
		}
		else
		{
			response.sendRedirect("makeQuotation.jsp?id="+quotation_id);
		}
		
		
		doGet(request, response);
	}

}
