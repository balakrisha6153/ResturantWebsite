

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginClass lc=new LoginClass();
      
    public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("number");
		boolean bool = lc.isValidUser(name,phoneNumber);
		if(bool) {
			 request.setAttribute("name", name);
		     request.setAttribute("phoneNumber", phoneNumber);
		     RequestDispatcher requestDispatcher = request.getRequestDispatcher("/UserProfileServlet");
		     requestDispatcher.forward(request, response);

		}
		else {
			out.println("<h1 style='color:red; text-align:center;'>Invalid Name and Number</h1>");
			out.println("<p style='color:red; text-align:center;'>please try again</p>");
			out.println("<div style='text-align:center;'><a href='index.html'>Home</a></div>");
		}
	}

}
