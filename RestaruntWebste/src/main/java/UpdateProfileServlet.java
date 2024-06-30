

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProfileServlet
 */
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = (String) request.getAttribute("name");
        String number = (String) request.getAttribute("phoneNumber");
      
        try {
        	String query = "select * from my_table where Fullname=(?) and phoneNumber=(?)";
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant","root","Bala@123");
			
			PreparedStatement pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, name);
			pstmt.setString(2, number);
			ResultSet rs = pstmt.executeQuery();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<html><head><style>");
            out.println("table { border-collapse: collapse; width: 100%; }");
            out.println("th, td { text-align: left; padding: 8px; }");
            out.println("tr:nth-child(even) { background-color: #f2f2f2; }");
            out.println("th { background-color: #4CAF50; color: white; }");
            out.println("</style></head><body>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>FullName</th>");
            out.println("<th>NoOfPersons</th>");
            out.println("<th>PhoneNumber</th>");
            out.println("<th>ReservedDate</th>");
            out.println("<th>ReservedTime</th>");
            out.println("<th>TypeOfMeal</th>");
            out.println("<th>itemName</th>");
            out.println("<th>TableNumber</th>");
            out.println("<th>Delete</th>");
            out.println("<th>Modify</th>");
            //out.println("<th>TableList</th>");
            out.println("</tr>");
            while(rs.next()) {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
            out.println("<td>"+rs.getString(8)+"</td>");
            out.println("<td><a href='DeleteTableServlet?name=" + name + "&number=" + number + "'>Delete</a></td>");
            out.println("<td><a href='update.jsp?name="+name+"&number="+number+"'>Modify</a></td>");
          //  out.println("<td><a href='ShowTableServlet'>tableList</a></td>");
            out.println("</tr>");
            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
	}

}
