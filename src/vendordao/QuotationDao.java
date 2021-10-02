package vendordao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entities.Product;
import entities.QuotationRequest;
import entities.QuotationSend;
import entities.QuotationRequest;
import helper.ConnectionProvider;
import servlets.SendQuotation;

public class QuotationDao {

	ConnectionProvider cp = new ConnectionProvider();
	Connection con = cp.getConnection();

	public boolean saveQuotationRequest(QuotationRequest quotationRequest) {

		try {

			String q = "insert into quotation_request(vendor_id,buyer_id,product_id,quantity,status,message) values (?,?,?,?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setInt(1, quotationRequest.getVendor_id());
			statement.setInt(2, quotationRequest.getBuyer_id());
			statement.setInt(3, quotationRequest.getProduct_id());
			statement.setInt(4, quotationRequest.getQuantity());
			statement.setString(5, quotationRequest.getStatus());
			statement.setString(6, quotationRequest.getMessage());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	public boolean saveSendQuotation(QuotationSend quotationSend) {

		try {

			String q = "update quotation_request set issuedate=? ,validdate=? ,wholesale_price=?,status=? where quotation_id=?";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setDate(1,quotationSend.getIssue_date() );
			statement.setDate(2,quotationSend.getValid_date() );
			statement.setInt(3,quotationSend.getWholesale_price() );
			statement.setString(4,quotationSend.getStatus() );
			statement.setInt(5,quotationSend.getQuotation_id() );
			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	
	

//	get quotation request by QuotationRequest id

	public List<QuotationRequest> getQuotationRequestsByVendorID(int vendor_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<QuotationRequest> quotationRequests = new ArrayList();

		try {
			String query = "select *from quotation_request where vendor_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);
			statement.setString(2, "request");

			ResultSet set = statement.executeQuery();

			quotationRequests = new ArrayList();
			while (set.next()) {

				QuotationRequest quotationRequest = new QuotationRequest();

				quotationRequest.setQuotation_id(set.getInt("quotation_id"));
				quotationRequest.setVendor_id(set.getInt("vendor_id"));
				quotationRequest.setBuyer_id(set.getInt("buyer_id"));
				quotationRequest.setQuantity(set.getInt("quantity"));
				quotationRequest.setProduct_id(set.getInt("product_id"));

				quotationRequest.setMessage(set.getString("message"));
				quotationRequest.setStatus(set.getString("status"));

				quotationRequests.add(quotationRequest);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return quotationRequests;
	}
	
	
	
	public List<QuotationRequest> getQuotationRequestsByBuyerID(int buyer_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<QuotationRequest> quotationRequests = new ArrayList();

		try {
			String query = "select *from quotation_request where buyer_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, buyer_id);
			statement.setString(2, "request");

			ResultSet set = statement.executeQuery();

			quotationRequests = new ArrayList();
			while (set.next()) {

				QuotationRequest quotationRequest = new QuotationRequest();

				quotationRequest.setQuotation_id(set.getInt("quotation_id"));
				quotationRequest.setVendor_id(set.getInt("vendor_id"));
				quotationRequest.setBuyer_id(set.getInt("buyer_id"));
				quotationRequest.setQuantity(set.getInt("quantity"));
				quotationRequest.setProduct_id(set.getInt("product_id"));

				quotationRequest.setMessage(set.getString("message"));
				quotationRequest.setStatus(set.getString("status"));

				quotationRequests.add(quotationRequest);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return quotationRequests;
	}
	
	
	
	
	
	
	
	
	public List<QuotationSend> getSendQuotationsByVendorID(int vendor_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<QuotationSend> quotationSends = new ArrayList();

		try {
			String query = "select *from quotation_request where vendor_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);
			statement.setString(2, "quotationSend");

			ResultSet set = statement.executeQuery();

			quotationSends = new ArrayList();
			while (set.next()) {

				QuotationSend quotationSend = new QuotationSend();

				quotationSend.setQuotation_id(set.getInt("quotation_id"));
				quotationSend.setVendor_id(set.getInt("vendor_id"));
				quotationSend.setBuyer_id(set.getInt("buyer_id"));
				quotationSend.setQuantity(set.getInt("quantity"));
				quotationSend.setProduct_id(set.getInt("product_id"));

				

				quotationSends.add(quotationSend);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return quotationSends;
	}
	
	
	public List<QuotationSend> getSendQuotationByBuyerID(int buyer_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<QuotationSend> quotationSends = new ArrayList();

		try {
			String query = "select *from quotation_request where Buyer_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, buyer_id);
			statement.setString(2, "quotationSend");

			ResultSet set = statement.executeQuery();

			quotationSends = new ArrayList();
			while (set.next()) {

				QuotationSend quotationSend = new QuotationSend();

				quotationSend.setQuotation_id(set.getInt("quotation_id"));
				quotationSend.setWholesale_price(set.getInt("wholesale_price"));
				quotationSend.setIssue_date(set.getDate("issuedate"));
				quotationSend.setValid_date(set.getDate("validdate"));
				
				quotationSend.setVendor_id(set.getInt("vendor_id"));
				quotationSend.setBuyer_id(set.getInt("buyer_id"));
				quotationSend.setQuantity(set.getInt("quantity"));
				quotationSend.setProduct_id(set.getInt("product_id"));
				
				quotationSends.add(quotationSend);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return quotationSends;
	}
	
	
	
	/* get quotation bye quotation id */
	
	public QuotationRequest getQuotationRequestsByQuotationID(int quotation_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		QuotationRequest quotationRequest = new QuotationRequest();

		try {
			String query = "select *from quotation_request where quotation_id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, quotation_id);
			

			ResultSet set = statement.executeQuery();

			
			while (set.next()) {

				 quotationRequest = new QuotationRequest();

				quotationRequest.setQuotation_id(set.getInt("quotation_id"));
				quotationRequest.setVendor_id(set.getInt("vendor_id"));
				quotationRequest.setBuyer_id(set.getInt("buyer_id"));
				quotationRequest.setQuantity(set.getInt("quantity"));
				quotationRequest.setProduct_id(set.getInt("product_id"));

				quotationRequest.setMessage(set.getString("message"));
				quotationRequest.setStatus(set.getString("status"));

				

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return quotationRequest;
	}

	
	
	
	
	
	public QuotationSend getSendQuotationByQuotationID(int quotation_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		QuotationSend quotationSend = new QuotationSend();

		try {
			String query = "select *from quotation_request where quotation_id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, quotation_id);
			

			ResultSet set = statement.executeQuery();

			
			while (set.next()) {

				quotationSend = new QuotationSend();

				quotationSend.setQuotation_id(set.getInt("quotation_id"));
				quotationSend.setVendor_id(set.getInt("vendor_id"));
				quotationSend.setBuyer_id(set.getInt("buyer_id"));
				quotationSend.setQuantity(set.getInt("quantity"));
				quotationSend.setProduct_id(set.getInt("product_id"));
				quotationSend.setWholesale_price(set.getInt("wholesale_price"));
				quotationSend.setIssue_date(set.getDate("issuedate"));
				quotationSend.setValid_date(set.getDate("validdate"));

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return quotationSend;
	}
	
	
	
	
	
	
	
	
	
	public void changeStatus(String status,int quotation_id)
	{
		try {

			String q = "update quotation_request set status=? where quotation_id=?";
			PreparedStatement statement = this.con.prepareStatement(q);
			
			statement.setString(1,status );
			statement.setInt(2,quotation_id );
			statement.executeUpdate();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
	}
	
	
	
	
	
	
	

}
