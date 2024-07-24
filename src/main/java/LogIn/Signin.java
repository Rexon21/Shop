package LogIn;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class Signin
 */
@WebServlet("/sign")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()) {

			String user = request.getParameter("User");
			String mobileno = request.getParameter("Mobileno");
			String Email = request.getParameter("Email");
			String passw = request.getParameter("Password");

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root",
					"Rexon@2002");

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from details");
			int count = 0;
			while (rs.next()) {
				String mobile = rs.getString("Mobile_No");
				String username = rs.getString("Email");

				if (user.equals(username)) {
					request.setAttribute("Invuser", "This User Email Already Exist");
					RequestDispatcher rp = request.getRequestDispatcher("Signup.jsp");
					rp.forward(request, response);
					count++;
				}

				else if (mobileno.equals(mobile)) {

					request.setAttribute("InvNum", "This User Mobile No Already Exist");
					RequestDispatcher rp1 = request.getRequestDispatcher("Signup.jsp");
					rp1.forward(request, response);
					count++;

				}

			}
			if (count == 0) {
				PreparedStatement stmt = con.prepareStatement("insert into Details values(?,?,?,?)");
				stmt.setString(1, user);
				stmt.setString(2, mobileno);
				stmt.setString(3, Email);
				stmt.setString(4, passw);
				int result = stmt.executeUpdate();
				if (result != 0) {

//					RequestDispatcher rp=request.getRequestDispatcher("index.jsp");
//					rp.forward(request, response);
					// HttpSession hp = request.getSession(true);
					response.sendRedirect("index.jsp");

				} else {

					out.print("Invalid Data");
					RequestDispatcher rp = request.getRequestDispatcher("Signup.jsp");
					rp.include(request, response);
				}
			}
		

		} catch (Exception e) {
			System.out.println(e);

		}
	}

}
