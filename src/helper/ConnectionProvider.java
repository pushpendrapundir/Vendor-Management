package helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public Connection con;

	public Connection getConnection() {

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/VMS", "root", "Dell@1234");
			return con;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;

	}
}
