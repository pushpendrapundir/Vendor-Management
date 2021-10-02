package helper;

public class Message {
	
	private String contant;
	private String type;
	private String cssclass;
	public Message(String contant, String type, String cssclass) {
		super();
		this.contant = contant;
		this.type = type;
		this.cssclass = cssclass;
	}
	public String getContant() {
		return contant;
	}
	public void setContant(String contant) {
		this.contant = contant;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssclass() {
		return cssclass;
	}
	public void setCssclass(String cssclass) {
		this.cssclass = cssclass;
	}
	
	
	

}
