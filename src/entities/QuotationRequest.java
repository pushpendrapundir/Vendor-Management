package entities;

public class QuotationRequest {

	int quotation_id;
	int vendor_id;
	int buyer_id;
	int product_id;
	int quantity;
	String status;
	String message;
	@Override
	public String toString() {
		return "QuotationRequest [quotation_id=" + quotation_id + ", vendor_id=" + vendor_id + ", buyer_id=" + buyer_id
				+ ", product_id=" + product_id + ", quantity=" + quantity + ", status=" + status + ", message="
				+ message + "]";
	}
	public QuotationRequest(int vendor_id, int buyer_id, int product_id, int quantity, String status, String message) {
		super();
		this.vendor_id = vendor_id;
		this.buyer_id = buyer_id;
		this.product_id = product_id;
		this.quantity = quantity;
		this.status = status;
		this.message = message;
	}
	public int getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(int quotation_id) {
		this.quotation_id = quotation_id;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public QuotationRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
