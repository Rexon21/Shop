package LogIn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import products.productcart;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class logout
 */
@WebServlet("/out")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		if(session!=null) {
		List<productcart> pro = (List<productcart>) session.getAttribute("productlist");
		pro=null;
		session.invalidate();}
		
	    response.sendRedirect("index.jsp");
	    
	}  

}
