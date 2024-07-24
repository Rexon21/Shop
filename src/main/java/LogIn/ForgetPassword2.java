package LogIn;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class ForgetPassword2
 */
@WebServlet("/for")
public class ForgetPassword2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String User = request.getParameter("Email");
		String Mobileno=request.getParameter("MobileNo");
		String Password=request.getParameter("CPassw");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root", "Rexon@2002");
			PreparedStatement stmt = con.prepareStatement("Update Details set Password= '"+Password+"' where Mobile_no='"+Mobileno+"'");
			int result = stmt.executeUpdate();
			if(result!=0) {
				request.setAttribute("value", "Password Changed Successfully");
				RequestDispatcher rp=request.getRequestDispatcher("ForgetPasswordPage2.jsp");
				rp.forward(request, response);
				
				//HttpSession hp = request.getSession(true);
				//response.sendRedirect("");
				
			}else {
				
				RequestDispatcher rp=request.getRequestDispatcher("ForgetPasswordPage2.jsp");
				rp.forward(request, response);
			}
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
