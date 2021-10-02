package vendordao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import categories.Category;
import entities.Vendor;
import helper.ConnectionProvider;

public class CategoryDao {
	
	ConnectionProvider cp = new ConnectionProvider();
	Connection con = cp.getConnection();
	
	public boolean saveCategory(Category category) {

		try {

			String q = "insert into categories (category,cat_desc,vendor_id) values (?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(q);
			statement.setString(1, category.getCategory());
			statement.setString(2, category.getCat_desc());
			statement.setLong(3, category.getVendor_id());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	public List<Category> getCategoriesByID(int vendor_id)
	{
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		
		ArrayList<Category> categories= new ArrayList();
		
		try {
			String query = "select *from categories where vendor_id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);
			

			ResultSet set = statement.executeQuery();
			
			categories=new ArrayList();
			while (set.next()) {

				
				Category category=new Category();
				
				category.setCat_id(set.getInt("cat_id"));
				category.setCategory(set.getString("category"));
				category.setCat_desc(set.getString("cat_desc"));
				
				categories.add(category);
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		
	
		
		
		return categories;
	}
	
	
	/* select all categories */
	public List<Category> getAllCategories()
	{
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		
		ArrayList<Category> categories= new ArrayList();
		
		try {
			String query = "select DISTINCT *from categories";
			PreparedStatement statement = con.prepareStatement(query);
			
			

			ResultSet set = statement.executeQuery();
			
			categories=new ArrayList();
			while (set.next()) {

				
				Category category=new Category();
				
				category.setCat_id(set.getInt("cat_id"));
				category.setCategory(set.getString("category"));
				category.setCat_desc(set.getString("cat_desc"));
				
				categories.add(category);
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		
	
		
		
		return categories;
	}
	
	

}
