package vendordao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import categories.Category;
import entities.Product;
import helper.ConnectionProvider;

public class ProductDao {

	ConnectionProvider cp = new ConnectionProvider();
	Connection con = cp.getConnection();

	public boolean saveproduct(Product product) {

		try {

			String q = "insert into product(product_name,product_picture,product_price,product_cat,product_desc,vendor_id) values (?,?,?,?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(q);

			statement.setString(1, product.getProduct_name());
			statement.setString(2, product.getProduct_picture());
			statement.setFloat(3, product.getProduct_price());
			statement.setString(4, product.getProduct_cat());
			statement.setString(5, product.getProduct_desc());
			statement.setInt(6, product.getVendor_id());

			statement.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

//	get product by vendor id

	public List<Product> getProductsByID(int vendor_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Product> products = new ArrayList();

		try {
			String query = "select *from product where vendor_id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, vendor_id);

			ResultSet set = statement.executeQuery();

			products = new ArrayList();
			while (set.next()) {

				Product product = new Product();

				product.setProduct_id(set.getInt("product_id"));
				product.setProduct_price(set.getFloat("product_price"));
				product.setProduct_name(set.getString("product_name"));
				product.setProduct_picture(set.getString("product_picture"));
				product.setProduct_cat(set.getString("product_cat"));
				product.setVendor_id(set.getInt("vendor_id"));
				product.setProduct_desc(set.getString("product_desc"));

//				category.setCat_id(set.getInt("cat_id"));
//				category.setCategory(set.getString("category"));
//				category.setCat_desc(set.getString("cat_desc"));

				products.add(product);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return products;
	}

//	get product by productid

	public Product getProductsByProductID(int product_id) {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

//		ArrayList<Product> products= new ArrayList();
		Product product = null;

		try {
			String query = "select *from product where product_id=?";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setLong(1, product_id);

			ResultSet set = statement.executeQuery();

//			products=new ArrayList();
			while (set.next()) {

				product = new Product();

				product.setProduct_id(set.getInt("product_id"));
				product.setProduct_price(set.getFloat("product_price"));
				product.setProduct_name(set.getString("product_name"));
				product.setProduct_picture(set.getString("product_picture"));
				product.setProduct_cat(set.getString("product_cat"));
				product.setVendor_id(set.getInt("vendor_id"));
				product.setProduct_desc(set.getString("product_desc"));

//				category.setCat_id(set.getInt("cat_id"));
//				category.setCategory(set.getString("category"));
//				category.setCat_desc(set.getString("cat_desc"));

//				products.add(product);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return product;
	}

//	get all product

	public List<Product> getAllProduct() {
		ConnectionProvider cp = new ConnectionProvider();
		Connection con = cp.getConnection();

		ArrayList<Product> products = new ArrayList();

		try {
			String query = "select *from product";
			PreparedStatement statement = con.prepareStatement(query);

			ResultSet set = statement.executeQuery();

			products = new ArrayList();
			while (set.next()) {

				Product product = new Product();

				product.setProduct_id(set.getInt("product_id"));
				product.setProduct_price(set.getFloat("product_price"));
				product.setProduct_name(set.getString("product_name"));
				product.setProduct_picture(set.getString("product_picture"));
				product.setProduct_cat(set.getString("product_cat"));
				product.setVendor_id(set.getInt("vendor_id"));
				product.setProduct_desc(set.getString("product_desc"));

				products.add(product);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return products;
	}

}
