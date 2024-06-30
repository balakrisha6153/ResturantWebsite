import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginClass {

public boolean isValidUser(String name,String number) {
	try {
		String query = "select * from my_table where Fullname=(?) and phoneNumber=(?)";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant","root","Bala@123");
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, number);
		ResultSet rs = pstmt.executeQuery();
		return rs.next();
		
	}
	catch(Exception e) {
		System.out.println(e.getMessage());
	}
	return false;
}
}
