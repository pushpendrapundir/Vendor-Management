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

import entities.Contract;
import entities.QuotationRequest;
import helper.Message;
import vendordao.ContractDao;
import vendordao.QuotationDao;

/**
 * Servlet implementation class ContractSendSevlet
 */
public class ContractSendSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContractSendSevlet() {
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
		// date logic convert string to sql date
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String contract_end_date0 = request.getParameter("contract_end_date");
		String endDate = contract_end_date0;
		java.util.Date date = null;
		try {
			date = sdf.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String contract_start_date0 = request.getParameter("contract_start_date");
		String startDate = contract_start_date0;
		java.util.Date date1 = null;
		try {
			date1 = sdf.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Date current_date = new Date(System.currentTimeMillis());
		java.sql.Date contract_end_date = new java.sql.Date(date.getTime());
		java.sql.Date contract_start_date = new java.sql.Date(date1.getTime());
		int quotation_id = Integer.parseInt(request.getParameter("quotation_id"));
		String contract_clause = request.getParameter("contract_clause");

		QuotationDao quotationDao = new QuotationDao();

		QuotationRequest quotationRequest = quotationDao.getQuotationRequestsByQuotationID(quotation_id);

		Contract contract = new Contract(quotation_id, "Request", current_date, contract_start_date, contract_end_date,
				contract_clause, quotationRequest.getVendor_id(), quotationRequest.getBuyer_id());

		ContractDao contractDao = new ContractDao();

		quotationDao.changeStatus("contractrequestsent", quotation_id);

		if (contractDao.saveContractRequest(contract)) {
			Message message = new Message("Contract request has been sent", "success",
					"alert-success");
			HttpSession s = request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("buyer_home.jsp");
		}

		else {
			Message message = new Message("Contract request failed ! Try Again", "danger", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("buyer_home.jsp");
		}

		doGet(request, response);
	}

}
