package entities;

public class Product {

	int product_id;
	float product_price;
	int vendor_id;
	
	String product_name;
	String product_picture;
	String product_cat;
	String product_desc;
	
	
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public float getProduct_price() {
		return product_price;
	}
	public void setProduct_price(float product_price) {
		this.product_price = product_price;
	}
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_picture() {
		return product_picture;
	}
	public void setProduct_picture(String product_picture) {
		this.product_picture = product_picture;
	}
	public String getProduct_cat() {
		return product_cat;
	}
	public void setProduct_cat(String product_cat) {
		this.product_cat = product_cat;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public Product(float product_price, int vendor_id, String product_name, String product_picture, String product_cat,
			String product_desc) {
		super();
		this.product_price = product_price;
		this.vendor_id = vendor_id;
		this.product_name = product_name;
		this.product_picture = product_picture;
		this.product_cat = product_cat;
		this.product_desc = product_desc;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_price=" + product_price + ", vendor_id=" + vendor_id
				+ ", product_name=" + product_name + ", product_picture=" + product_picture + ", product_cat="
				+ product_cat + ", product_desc=" + product_desc + "]";
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int product_id, float product_price, int vendor_id, String product_name, String product_picture,
			String product_cat, String product_desc) {
		super();
		this.product_id = product_id;
		this.product_price = product_price;
		this.vendor_id = vendor_id;
		this.product_name = product_name;
		this.product_picture = product_picture;
		this.product_cat = product_cat;
		this.product_desc = product_desc;
	}
	
	
	
	
	
	
}
