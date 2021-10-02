package vendordao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entities.Contract;
import entities.QuotationRequest;
import helper.ConnectionProvider;

public class ContractDao {
	
	ConnectionProvider cp = new ConnectionProvider();
	Connection con = cp.getConnection();
	
	
	public boolean saveContractRequest(Contract contract) {

		try {

			String q = "insert into contract(quotation_id,status,issue_date,start_date,end_date,clause,vendor_id,buyer_id) values (?,?,?,?,?,?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setInt(1, contract.getQuotation_id());
			statement.setString(2, contract.getStatus());
			statement.setDate(3, contract.getIssue_date());
			statement.setDate(4, contract.getStart_date());
			statement.setDate(5, contract.getEnd_date());
			statement.setString(6, contract.getClause());
			statement.setInt(7, contract.getVendor_id());
			statement.setInt(8, contract.getBuyer_id());
			

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	public boolean changeContractStatus(Contract contract) {

		try {

			String q = "update contract set status=?,contract_accept_date=? where contract_id=?";
			PreparedStatement statement = this.con.prepareStatement(q);
			
			statement.setString(1, contract.getStatus());
			statement.setDate(2, contract.getContract_accept_date());
			statement.setInt(3, contract.getContract_id());
			

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	public List<Contract> getContractRequestsByBuyerID(int buyer_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Contract> contractRequests = new ArrayList();

		try {
			String query = "select *from contract where buyer_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, buyer_id);
			statement.setString(2, "request");

			ResultSet set = statement.executeQuery();

			contractRequests = new ArrayList();
			while (set.next()) {

				Contract contractRequest = new Contract();

				contractRequest.setContract_id(set.getInt("contract_id"));
				contractRequest.setQuotation_id(set.getInt("quotation_id"));
				contractRequest.setVendor_id(set.getInt("vendor_id"));
				contractRequest.setBuyer_id(set.getInt("buyer_id"));
				contractRequest.setStatus(set.getString("status"));
				contractRequest.setIssue_date(set.getDate("issue_date"));
				contractRequest.setStart_date(set.getDate("start_date"));
				contractRequest.setEnd_date(set.getDate("end_date"));
				contractRequest.setClause(set.getString("clause"));
				
				contractRequests.add(contractRequest);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return contractRequests;
	}
	
	
	
	public List<Contract> getAcceptedContractByBuyerID(int buyer_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Contract> contractRequests = new ArrayList();

		try {
			String query = "select *from contract where buyer_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, buyer_id);
			statement.setString(2, "contractAccepted");

			ResultSet set = statement.executeQuery();

			contractRequests = new ArrayList();
			while (set.next()) {

				Contract contractRequest = new Contract();

				contractRequest.setContract_id(set.getInt("contract_id"));
				contractRequest.setQuotation_id(set.getInt("quotation_id"));
				contractRequest.setVendor_id(set.getInt("vendor_id"));
				contractRequest.setBuyer_id(set.getInt("buyer_id"));
				contractRequest.setStatus(set.getString("status"));
				contractRequest.setIssue_date(set.getDate("issue_date"));
				contractRequest.setStart_date(set.getDate("start_date"));
				contractRequest.setEnd_date(set.getDate("end_date"));
				contractRequest.setClause(set.getString("clause"));
				
				contractRequests.add(contractRequest);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return contractRequests;
	}
	
	
	public List<Contract> getContractRequestsByVendorID(int vendor_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Contract> contractRequests = new ArrayList();

		try {
			String query = "select *from contract where vendor_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);
			statement.setString(2, "request");

			ResultSet set = statement.executeQuery();

			contractRequests = new ArrayList();
			while (set.next()) {

				Contract contractRequest = new Contract();

				contractRequest.setContract_id(set.getInt("contract_id"));
				contractRequest.setQuotation_id(set.getInt("quotation_id"));
				contractRequest.setVendor_id(set.getInt("vendor_id"));
				contractRequest.setBuyer_id(set.getInt("buyer_id"));
				contractRequest.setStatus(set.getString("status"));
				contractRequest.setIssue_date(set.getDate("issue_date"));
				contractRequest.setStart_date(set.getDate("start_date"));
				contractRequest.setEnd_date(set.getDate("end_date"));
				contractRequest.setClause(set.getString("clause"));
				
				contractRequests.add(contractRequest);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return contractRequests;
	}
	
	
	public List<Contract> getAcceptedContractsByVendorID(int vendor_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Contract> acceptedContracts = new ArrayList();

		try {
			String query = "select *from contract where vendor_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);
			statement.setString(2, "contractAccepted");

			ResultSet set = statement.executeQuery();

			acceptedContracts = new ArrayList();
			while (set.next()) {

				Contract acceptedContract = new Contract();

				acceptedContract.setContract_id(set.getInt("contract_id"));
				acceptedContract.setQuotation_id(set.getInt("quotation_id"));
				acceptedContract.setVendor_id(set.getInt("vendor_id"));
				acceptedContract.setBuyer_id(set.getInt("buyer_id"));
				acceptedContract.setStatus(set.getString("status"));
				acceptedContract.setIssue_date(set.getDate("issue_date"));
				acceptedContract.setStart_date(set.getDate("start_date"));
				acceptedContract.setEnd_date(set.getDate("end_date"));
				acceptedContract.setClause(set.getString("clause"));
				
				acceptedContracts.add(acceptedContract);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return acceptedContracts;
	}
	
	
	public List<Contract> getContractByContractID(int contract_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Contract> contractRequests = new ArrayList();

		try {
			String query = "select *from contract where contract_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, contract_id);
			statement.setString(2, "request");

			ResultSet set = statement.executeQuery();

			contractRequests = new ArrayList();
			while (set.next()) {

				Contract contractRequest = new Contract();

				contractRequest.setContract_id(set.getInt("contract_id"));
				contractRequest.setQuotation_id(set.getInt("quotation_id"));
				contractRequest.setVendor_id(set.getInt("vendor_id"));
				contractRequest.setBuyer_id(set.getInt("buyer_id"));
				contractRequest.setStatus(set.getString("status"));
				contractRequest.setIssue_date(set.getDate("issue_date"));
				contractRequest.setStart_date(set.getDate("start_date"));
				contractRequest.setEnd_date(set.getDate("end_date"));
				contractRequest.setClause(set.getString("clause"));
				
				contractRequests.add(contractRequest);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return contractRequests;
	}
	
	
	public Contract getSingleContractByContractID(int contract_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		Contract contractRequest =null;

		try {
			String query = "select *from contract where contract_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, contract_id);
			statement.setString(2, "request");

			ResultSet set = statement.executeQuery();

			contractRequest = new Contract();
			while (set.next()) {

				

				contractRequest.setContract_id(set.getInt("contract_id"));
				contractRequest.setQuotation_id(set.getInt("quotation_id"));
				contractRequest.setVendor_id(set.getInt("vendor_id"));
				contractRequest.setBuyer_id(set.getInt("buyer_id"));
				contractRequest.setStatus(set.getString("status"));
				contractRequest.setIssue_date(set.getDate("issue_date"));
				contractRequest.setStart_date(set.getDate("start_date"));
				contractRequest.setEnd_date(set.getDate("end_date"));
				contractRequest.setClause(set.getString("clause"));
				
			

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	
		return contractRequest;
	}
	
	
	
	public Contract getSingleAcceptedContractByContractID(int contract_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		Contract contractRequest =null;

		try {
			String query = "select *from contract where contract_id=? and status=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, contract_id);
			statement.setString(2, "contractAccepted");

			ResultSet set = statement.executeQuery();

			contractRequest = new Contract();
			while (set.next()) {

				

				contractRequest.setContract_id(set.getInt("contract_id"));
				contractRequest.setQuotation_id(set.getInt("quotation_id"));
				contractRequest.setVendor_id(set.getInt("vendor_id"));
				contractRequest.setBuyer_id(set.getInt("buyer_id"));
				contractRequest.setStatus(set.getString("status"));
				contractRequest.setIssue_date(set.getDate("issue_date"));
				contractRequest.setStart_date(set.getDate("start_date"));
				contractRequest.setEnd_date(set.getDate("end_date"));
				contractRequest.setClause(set.getString("clause"));
				
			

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	
		return contractRequest;
	}

}
