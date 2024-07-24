package products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@WebServlet("/CartServlet") // URL mapping for the servlet
public class CartServlet extends HttpServlet {
	
	 LinkedList<productcart> dd = new LinkedList<productcart>();
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String productId = request.getParameter("product_id");
        int id=Integer.parseInt(productId);
        String proprice = request.getParameter("price");
        int price=Integer.parseInt(proprice);
        String quantity = request.getParameter("quantity");
        int quan =Integer.parseInt(quantity);
        String productname = request.getParameter("pname");
        String imgsrc= request.getParameter("img");
        // Simulate adding to cart (You can replace this with actual cart logic)
        // Here, we'll just print the received information
        System.out.println(imgsrc);
        response.setContentType("text/html");
     
        	boolean found = false;

            // Check if the product already exists in the cart
            for (productcart pro : dd) {
                if (pro.getId() == id) {
                    found = true;
                    break;
                }
            }

            if (!found) {
                dd.add(new productcart(productname, price, quan, id, imgsrc));
            }
            
 
        HttpSession session = request.getSession();
        session.setAttribute("productlist", dd);
        request.getRequestDispatcher("cartitems.jsp");
        request.getRequestDispatcher("/cartdelete");
        response.sendRedirect("FirstPage.jsp");
        
       
    }
}
