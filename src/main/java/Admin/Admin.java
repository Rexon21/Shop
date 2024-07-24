package Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import products.productcart;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class Admin
 */
@MultipartConfig
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    String productId = request.getParameter("product_id");
		    System.out.println(productId);
	        int id = Integer.parseInt(productId);
	        System.out.println(id);
	        String pname = request.getParameter("pname");
	        String proprice = request.getParameter("price");
	        int price = Integer.parseInt(proprice);
	        String quantity = request.getParameter("quantity");
	        int quan = Integer.parseInt(quantity);

	        Part filePart = request.getPart("img");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	        String imagePath = "image/" + fileName; 
	        File uploads = new File("C:\\Users\\user\\eclipse-workspace_Enterprise\\shop\\src\\main\\webapp\\image"); 
	        if (!uploads.exists()) {
	            uploads.mkdirs();
	        }

	        File file = new File(uploads, fileName);
	        try (InputStream input = filePart.getInputStream()) {
	            Files.copy(input, file.toPath());
	        }
	        
	    	try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root",
						"Rexon@2002");
			
					
				PreparedStatement stmt = con.prepareStatement("insert into productdetails values(?,?,?,?,?)");
				
			
				stmt.setInt(1, id);
				   

				stmt.setString(2, pname);
				stmt.setInt(3,price);
				stmt.setInt(4, quan);
				stmt.setString(5,imagePath);
				
				stmt.executeUpdate();
				 System.out.println(id);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


	        // Redirect to the admin page or display a success message
	        response.sendRedirect("Admin.jsp");

	}

}
