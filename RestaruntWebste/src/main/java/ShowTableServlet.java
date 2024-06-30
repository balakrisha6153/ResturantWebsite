import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowTableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShowTableServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String query = "select * from my_table";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant", "root", "Bala@123");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
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
            out.println("<th>Home</td>");
            out.println("</tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString(1) + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td>");
                out.println("<td>" + rs.getString(4) + "</td>");
                out.println("<td>" + rs.getString(5) + "</td>");
                out.println("<td>" + rs.getString(6) + "</td>");
                out.println("<td>" + rs.getString(7) + "</td>");
                out.println("<td>" + rs.getString(8) + "</td>");
                out.println("<td><a href='index.html'>Home</a></td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}