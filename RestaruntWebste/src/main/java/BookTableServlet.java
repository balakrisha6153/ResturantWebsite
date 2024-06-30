

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookTableServlet
 */
public class BookTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BookTableServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String fullName=request.getParameter("FullName");
		//System.out.println(tablenumber);
		String persons = request.getParameter("Persons");
		//System.out.println(name);
		String phoneNumber = request.getParameter("PhoneNumber");
		//System.out.println(phoneNumber);
		String date = request.getParameter("Date");
		//System.out.println(date);
		String Time = request.getParameter("Time");
		//System.out.println(itemName);
		String category = request.getParameter("category");
		//System.out.println(itemQuantity);
		String itemName = request.getParameter("itemName");
		//System.out.println(drinks);
		String tableNumber = request.getParameter("tableNumber");
		//System.out.println(drinksQuantity);
		
		try {
			String query = "insert into my_table values (?,?,?,?,?,?,?,?)";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant","root","Bala@123");
			//System.out.println("Connected Sucessfully");
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, fullName);
			pstmt.setString(2, persons);
			pstmt.setString(3, phoneNumber);
			pstmt.setString(4,date);
			pstmt.setString(5,Time);
			pstmt.setString(6, category);
			pstmt.setString(7, itemName);
			pstmt.setString(8, tableNumber);
			int k = pstmt.executeUpdate();
			con.close();
			PrintWriter out = response.getWriter();
			if(k==1) {
			out.println("<h1 style='color:red; text-align:center;'>Table booked Sucessfully</h1>");
			}
			else {
			out.println("<h1 style='color:red; text-align:center;'>No Table Booked</h1>");
			}
			 out.println("<!DOCTYPE html>");
		        out.println("<html>");
		        out.println("<head>");
		        out.println("<title>My Servlet Page</title>");
		        out.println("</head>");
		        out.println("<body>");

		        // Add an anchor tag
		        out.println("<div style='text-align:center;'><a href='index.html'>Home</a></div>");

		        out.println("</body>");
		        out.println("</html>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
