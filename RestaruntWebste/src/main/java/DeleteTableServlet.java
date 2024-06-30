import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTableServlet")
public class DeleteTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("name");
        String number = request.getParameter("number");
        PrintWriter out = response.getWriter();
        try {
        	String query = "delete from my_table where Fullname=(?) and phoneNumber=(?)";
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant","root","Bala@123");
        	PreparedStatement pstmt = con.prepareStatement(query);
        	pstmt.setString(1, name);
        	pstmt.setString(2, number);
        	int k = pstmt.executeUpdate();
        	if(k==1) {
        		out.println("<h1 style='color:red; text-align:center;'>Cancel our table Sucessfully</h1>");
        	}
        	else {
        		out.println("<h1 style='color:red; text-align:center;'> No table to Cancel</h1>");
        	}
        	
        	out.println("<div style='text-align:center;'><a href='index.html'>Home</a></div>");
        	con.close();
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
	}

}
