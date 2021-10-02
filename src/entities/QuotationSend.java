package entities;

import java.sql.Date;

public class QuotationSend {
	int quotation_id;
	int wholesale_price;
	String status;
	Date issue_date;
	Date valid_date;
	
	int vendor_id;
	int buyer_id;
	int product_id;
	int quantity;
	
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
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public QuotationSend(int quotation_id, int wholesale_price, String status, Date issue_date, Date valid_date) {
		super();
		this.quotation_id = quotation_id;
		this.wholesale_price = wholesale_price;
		this.status = status;
		this.issue_date = issue_date;
		this.valid_date = valid_date;
	}
	@Override
	public String toString() {
		return "QuotationSend [quotation_id=" + quotation_id + ", wholesale_price=" + wholesale_price + ", status="
				+ status + ", issue_date=" + issue_date + ", valid_date=" + valid_date + "]";
	}
	public int getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(int quotation_id) {
		this.quotation_id = quotation_id;
	}
	public int getWholesale_price() {
		return wholesale_price;
	}
	public void setWholesale_price(int wholesale_price) {
		this.wholesale_price = wholesale_price;
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
	public Date getValid_date() {
		return valid_date;
	}
	public void setValid_date(Date valid_date) {
		this.valid_date = valid_date;
	}
	public QuotationSend() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuotationSend(int wholesale_price, String status, Date issue_date, Date valid_date) {
		super();
		this.wholesale_price = wholesale_price;
		this.status = status;
		this.issue_date = issue_date;
		this.valid_date = valid_date;
	}
	
	
	
}
