package vendordao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entities.Vendor;
import helper.ConnectionProvider;

public class VendorDao {

	ConnectionProvider cp = new ConnectionProvider();
	Connection con = cp.getConnection();

	public boolean saveVendor(Vendor vendor) {

		try {

			String q = "insert into vendor(name,email,password) values (?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setString(1, vendor.getName());
			statement.setString(2, vendor.getEmail());
			statement.setString(3, vendor.getPassword());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public Vendor getVendorByEmailAndPassword(String email, String password) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		Vendor vendor = null;
		try {
			String query = "select *from vendor where email=? and password =?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);

			ResultSet set = statement.executeQuery();
			if (set.next()) {

				
				vendor = new Vendor();
				vendor.setId(Integer.parseInt(set.getString("id")));
				vendor.setName(set.getString("name"));
				vendor.setEmail(set.getString("email"));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return vendor;
	}
	
	
	public Vendor getVendorByID(int id)
	{
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		Vendor vendor = null;
		try {
			String query = "select *from vendor where id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, id);
			

			ResultSet set = statement.executeQuery();
			if (set.next()) {

				
				vendor = new Vendor();
				vendor.setId(Integer.parseInt(set.getString("id")));
				vendor.setName(set.getString("name"));
				vendor.setEmail(set.getString("email"));
				vendor.setCompany(set.getString("company"));
				vendor.setCity(set.getString("city"));
				vendor.setState(set.getString("state"));
				
				
				vendor.setGstnumber(Long.parseLong(set.getString("gstnumber")));
				vendor.setMobile(Long.parseLong(set.getString("mobile")));
				vendor.setPincode(Long.parseLong(set.getString("pincode")));
				
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return vendor;
	}
	
	public String getVendorNameByVendorId(int vendor_id)
	{
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		String vendor_name = null;
		try {
			String query = "select name from vendor where id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);
			

			ResultSet set = statement.executeQuery();
			if (set.next()) {

				
				
				vendor_name=set.getString("name");
				
				
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return vendor_name;
	}
	
	
	//update vendor
	
	public boolean updateVendor(Vendor vendor) {

		try {

			String q = "update vendor set name=?,email=?,pincode=?,city=?,state=?,company=?,mobile=?,gstnumber=? where id=?";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setString(1, vendor.getName());
			statement.setString(2, vendor.getEmail());
			statement.setLong(3, vendor.getPincode());
			statement.setString(4, vendor.getCity());
			statement.setString(5, vendor.getState());
			statement.setString(6, vendor.getCompany());
			statement.setLong(7, vendor.getMobile());
			statement.setLong(8, vendor.getGstnumber());
			statement.setLong(9, vendor.getId());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
