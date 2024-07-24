package Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class productmodify
 */
public class productmodify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String action = request.getParameter("action");
		 String product = request.getParameter("pname");
		 String id = request.getParameter("product_id");
		 String price = request.getParameter("price");
		 String quantity = request.getParameter("quantity");
		 response.setContentType("text/html");
		 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root", "Rexon@2002");
		
	        
	        if ("Update".equals(action)) {
	        	
	        	PreparedStatement stmt = con.prepareStatement("update productdetails set pname='"+product+"' ,price="+price+" ,quantity="+quantity+" where id="+id);
				stmt.executeUpdate();
	            response.sendRedirect("Productsmanage.jsp");
	           
	        } else if ("Remove".equals(action)) {
	        	PreparedStatement stmt = con.prepareStatement("Delete from productdetails where id='"+id+"'");
				stmt.executeUpdate();
	            response.sendRedirect("Productsmanage.jsp");
	        } 
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

}
