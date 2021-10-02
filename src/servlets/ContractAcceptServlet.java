package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Contract;
import helper.Message;
import vendordao.ContractDao;

/**
 * Servlet implementation class ContractAcceptServlet
 */
public class ContractAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContractAcceptServlet() {
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
		Date contract_accept_date = new Date(System.currentTimeMillis());
		
		Integer contract_id =Integer.parseInt( request.getParameter("contract_id"));
		
		Contract contract= new Contract(contract_id, "contractAccepted", contract_accept_date);
		ContractDao contractDao=new ContractDao();
		if (contractDao.changeContractStatus(contract)) {
			Message message =new Message("You have accepted the contract" , "success", "alert-success");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("vendor_home.jsp");
		}
		else {
			Message message =new Message("Something went to wrong !!! try again" , "error", "alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("message", message);
			response.sendRedirect("viewContract.jsp?id="+contract_id);
		}
		
		
//		System.out.println(current_date);
//		System.out.println(contract_id);
		
		
		doGet(request, response);
	}

}
