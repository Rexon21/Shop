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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class ForgetPassword
 */

@WebServlet("/ffff")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String User = request.getParameter("User");
		String Mobileno=request.getParameter("Mobileno");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root", "Rexon@2002");
			Statement stmt = con.createStatement();
			ResultSet rs =stmt.executeQuery("select * from details");
			int flag=0;
			while(rs.next()) {
				String mob=rs.getString("Mobile_no");
				String Email=rs.getString("Email");
				
				if(Email.equals(User)) {
					flag=1;
					if(mob.equals(Mobileno)) {
						request.setAttribute("mobile", mob);
						request.setAttribute("user", Email);
						RequestDispatcher rp=request.getRequestDispatcher("ForgetPasswordPage2.jsp");
						rp.forward(request, response);
						
						//response.sendRedirect("ForgetPasswordPage2.jsp");
						
						
					}else {
						request.setAttribute("invalid", "User Not Exist Check User & Mobile Number");
						RequestDispatcher rp=request.getRequestDispatcher("ForgetPassword.jsp");
						rp.forward(request, response);
					}
				}
			}
			
			if(flag==0) {
				request.setAttribute("invalid", "User Not Exist Check User & Mobile Number");
				RequestDispatcher rp=request.getRequestDispatcher("ForgetPassword.jsp");
				rp.forward(request, response);
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
