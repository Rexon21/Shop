package products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

/**
 * Servlet implementation class Order
 */
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		List<productcart> pro = (List<productcart>) session.getAttribute("productlist");
	
		
		String name = (String) session.getAttribute("Name");
		String email=(String) session.getAttribute("Mail");
		String mobileno=(String) session.getAttribute("Mobileno");
		LocalDate currentDate = LocalDate.now();
		String date = currentDate.toString();
		
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root",
					"Rexon@2002");
			for (productcart product : pro) {
				
			PreparedStatement stmt = con.prepareStatement("insert into orderdetails values(?,?,?,?,?,?,?,?)");
			PreparedStatement stmt1 = con.prepareStatement("Update productDetails set quantity -= "+product.getQuantity()+" where id="+ product.getId()+"");
			
			stmt.setString(1, name);
			stmt.setString(2, mobileno);
			stmt.setString(3, email);
			stmt.setInt(4, product.getId());
			stmt.setString(5, product.getProduct_name());
			stmt.setInt(6, product.getPrice());
			stmt.setInt(7, product.getQuantity());
			stmt.setString(8,date);
			stmt1.executeUpdate();
			stmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 response.setContentType("text/html");
		 response.sendRedirect("Order.jsp");
	
		
	}

}
