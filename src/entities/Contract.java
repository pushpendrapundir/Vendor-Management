package entities;

import java.sql.Date;

public class Contract {
	
	int contract_id;
	int quotation_id;
	String status;
	Date issue_date;
	Date start_date;
	Date end_date;
	String clause;
	
	Date contract_accept_date;
	
	public Date getContract_accept_date() {
		return contract_accept_date;
	}
	public void setContract_accept_date(Date contract_accept_date) {
		this.contract_accept_date = contract_accept_date;
	}
	int vendor_id;
	int buyer_id;
	
	
	
	public Contract() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	public int getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getContract_id() {
		return contract_id;
	}
	public void setContract_id(int contract_id) {
		this.contract_id = contract_id;
	}
	public int getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(int quotation_id) {
		this.quotation_id = quotation_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getClause() {
		return clause;
	}
	public void setClause(String clause) {
		this.clause = clause;
	}
	@Override
	public String toString() {
		return "Contract [contract_id=" + contract_id + ", quotation_id=" + quotation_id + ", status=" + status
				+ ", issue_date=" + issue_date + ", start_date=" + start_date + ", end_date=" + end_date + ", clause="
				+ clause + "]";
	}
	public Contract(int contract_id, int quotation_id, String status, Date issue_date, Date start_date, Date end_date,
			String clause) {
		super();
		this.contract_id = contract_id;
		this.quotation_id = quotation_id;
		this.status = status;
		this.issue_date = issue_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.clause = clause;
	}
	public Contract(int quotation_id, String status, Date issue_date, Date start_date, Date end_date, String clause) {
		super();
		this.quotation_id = quotation_id;
		this.status = status;
		this.issue_date = issue_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.clause = clause;
	}
	public Contract(int contract_id, int quotation_id, String status, Date issue_date, Date start_date, Date end_date,
			String clause, int vendor_id, int buyer_id) {
		super();
		this.contract_id = contract_id;
		this.quotation_id = quotation_id;
		this.status = status;
		this.issue_date = issue_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.clause = clause;
		this.vendor_id = vendor_id;
		this.buyer_id = buyer_id;
	}
	public Contract( int quotation_id, String status, Date issue_date, Date start_date, Date end_date,
			String clause, int vendor_id, int buyer_id) {
		super();
		
		this.quotation_id = quotation_id;
		this.status = status;
		this.issue_date = issue_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.clause = clause;
		this.vendor_id = vendor_id;
		this.buyer_id = buyer_id;
	}
	
	public Contract(int contract_id, String status, Date contract_accept_date) {
		super();
		this.contract_id = contract_id;
		this.status = status;
		this.contract_accept_date = contract_accept_date;
	}
	
	
	
	
	
	

}
