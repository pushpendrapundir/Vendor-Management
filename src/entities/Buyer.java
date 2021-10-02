package entities;

public class Buyer {
	String name;
	String email;
	String password;
	String city;
	String state;
	String company;
	String profile;
	Long mobile;
	Long gstnumber;
	Long pincode;
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
	public Long getMobile() {
		return mobile;
	}
	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}
	public Long getGstnumber() {
		return gstnumber;
	}
	public void setGstnumber(Long gstnumber) {
		this.gstnumber = gstnumber;
	}
	public Long getPincode() {
		return pincode;
	}
	public void setPincode(Long pincode) {
		this.pincode = pincode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	public Buyer(String name, String email, String password, String city, String state, String company, String profile,
			Long mobile, Long gstnumber, Long pincode, int id) {
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
	public Buyer(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
	}
	public Buyer(String name, String email, String password, String city, String state, String company, String profile,
			Long mobile, Long gstnumber, Long pincode) {
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
	public Buyer() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Buyer [name=" + name + ", email=" + email + ", password=" + password + ", city=" + city + ", state="
				+ state + ", company=" + company + ", profile=" + profile + ", mobile=" + mobile + ", gstnumber="
				+ gstnumber + ", pincode=" + pincode + ", id=" + id + "]";
	}
	
	
}
