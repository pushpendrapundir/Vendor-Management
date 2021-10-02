package vendordao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entities.Buyer;

import helper.ConnectionProvider;

public class BuyerDao {
	
	ConnectionProvider cp = new ConnectionProvider();
	Connection con = cp.getConnection();

	public boolean saveBuyer(Buyer buyer) {

		try {

			String q = "insert into buyer(name,email,password) values (?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setString(1, buyer.getName());
			statement.setString(2, buyer.getEmail());
			statement.setString(3, buyer.getPassword());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	public Buyer getBuyerByEmailAndPassword(String email, String password) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		Buyer buyer = null;
		try {
			String query = "select *from buyer where email=? and password =?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);

			ResultSet set = statement.executeQuery();
			if (set.next()) {

				
				buyer = new Buyer();
				buyer.setId(Integer.parseInt(set.getString("id")));
				buyer.setName(set.getString("name"));
				buyer.setEmail(set.getString("email"));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return buyer;
	}
	
	

	public Buyer getBuyerByID(int id)
	{
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		Buyer buyer = null;
		try {
			String query = "select *from buyer where id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, id);
			

			ResultSet set = statement.executeQuery();
			if (set.next()) {

				
				buyer = new Buyer();
				buyer.setId(Integer.parseInt(set.getString("id")));
				buyer.setName(set.getString("name"));
				buyer.setEmail(set.getString("email"));
				buyer.setCompany(set.getString("company"));
				buyer.setCity(set.getString("city"));
				buyer.setState(set.getString("state"));
				
				
				buyer.setGstnumber(Long.parseLong(set.getString("gstnumber")));
				buyer.setMobile(Long.parseLong(set.getString("mobile")));
				buyer.setPincode(Long.parseLong(set.getString("pincode")));
				
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return buyer;
	}
	
	
	//update buyer
	
	public boolean updatebuyer(Buyer buyer) {

		try {

			String q = "update buyer set name=?,email=?,pincode=?,city=?,state=?,company=?,mobile=?,gstnumber=? where id=?";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setString(1, buyer.getName());
			statement.setString(2, buyer.getEmail());
			statement.setLong(3, buyer.getPincode());
			statement.setString(4, buyer.getCity());
			statement.setString(5, buyer.getState());
			statement.setString(6, buyer.getCompany());
			statement.setLong(7, buyer.getMobile());
			statement.setLong(8, buyer.getGstnumber());
			statement.setLong(9, buyer.getId());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	public String getBuyerNameByBuyerId(int buyer_id)
	{
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		String buyer_name = null;
		try {
			String query = "select name from buyer where id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, buyer_id);
			

			ResultSet set = statement.executeQuery();
			if (set.next()) {

				
				
				buyer_name=set.getString("name");
				
				
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return buyer_name;
	}

}
