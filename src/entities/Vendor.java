package entities;

public class Vendor {
	
	String name;
	String email;
	String password;
	String city;
	String state;
	String company;
	String profile;
	long  mobile;
	long  gstnumber;
	long  pincode;
	int id;
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public long getMobile() {
		return mobile;
	}


	public void setMobile(long mobile) {
		this.mobile = mobile;
	}


	public long getGstnumber() {
		return gstnumber;
	}


	public void setGstnumber(long gstnumber) {
		this.gstnumber = gstnumber;
	}


	public long getPincode() {
		return pincode;
	}


	public void setPincode(long pincode) {
		this.pincode = pincode;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Vendor(String name, String email, String password, String city, String state, String company, String profile,
			long mobile, long gstnumber, long pincode, int id) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.city = city;
		this.state = state;
		this.company = company;
		this.profile = profile;
		this.mobile = mobile;
		this.gstnumber = gstnumber;
		this.pincode = pincode;
		this.id = id;
	}
	
	
	public Vendor(String name, String email, String city, String state, String company, long mobile, long gstnumber,
			long pincode) {
		super();
		this.name = name;
		this.email = email;
		this.city = city;
		this.state = state;
		this.company = company;
		this.mobile = mobile;
		this.gstnumber = gstnumber;
		this.pincode = pincode;
	}
	public Vendor(String name, String email, String city, String state, String company, long mobile, long gstnumber,
			long pincode, int id) {
		super();
		this.name = name;
		this.email = email;
		this.city = city;
		this.state = state;
		this.company = company;
		this.mobile = mobile;
		this.gstnumber = gstnumber;
		this.pincode = pincode;
		this.id = id;
	}
	public Vendor() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Vendor [name=" + name + ", email=" + email + ", password=" + password + ", city=" + city + ", state="
				+ state + ", company=" + company + ", profile=" + profile + ", mobile=" + mobile + ", gstnumber="
				+ gstnumber + ", pincode=" + pincode + ", id=" + id + "]";
	}
	public Vendor(String name, String email, String password, String city, String state, String company, String profile,
			long mobile, long gstnumber, long pincode) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.city = city;
		this.state = state;
		this.company = company;
		this.profile = profile;
		this.mobile = mobile;
		this.gstnumber = gstnumber;
		this.pincode = pincode;
	}
	public Vendor(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
	}
	
	
	
	

}
