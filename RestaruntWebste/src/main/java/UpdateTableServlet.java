import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTableServlet")
public class UpdateTableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fullName = request.getParameter("FullName");
        String persons = request.getParameter("Persons");
        String phoneNumber = request.getParameter("PhoneNumber");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        String category = request.getParameter("category");
        String itemName = request.getParameter("itemName");
        String tableNumber = request.getParameter("tableNumber");

        try {
            String query = "UPDATE my_table SET noOfpersons = ?, b_date = ?, b_time = ?, meal = ?, itemName = ?, tableNo = ? WHERE Fullname = ? AND phoneNumber = ?";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resturant", "root", "Bala@123");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, persons);
            pstmt.setString(2, date);
            pstmt.setString(3, time);
            pstmt.setString(4, category);
            pstmt.setString(5, itemName);
            pstmt.setString(6, tableNumber);
            pstmt.setString(7, fullName);
            pstmt.setString(8, phoneNumber);
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<h1>Table details updated successfully!</h1>");
            } else {
                out.println("<h1>No table found to update.</h1>");
            }

            request.setAttribute("name", fullName);
		     request.setAttribute("phoneNumber", phoneNumber);
		     RequestDispatcher requestDispatcher = request.getRequestDispatcher("/UpdateProfileServlet");
		     requestDispatcher.forward(request, response);
		     con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}