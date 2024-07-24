package products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;

/**
 * Servlet implementation class cartdelete
 */
public class cartdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session1 = request.getSession();
		String id = request.getParameter("id");
		int idp=Integer.parseInt(id);
		List<productcart> product =(List<productcart>) session1.getAttribute("productlist");
		
		Iterator<productcart> it = product.iterator();
		try {
		while(it.hasNext()) {
			if(it.next().getId()==idp) {
				it.remove();
			}
		}}catch(ConcurrentModificationException e) {
			System.out.println(e);
		}
		
		
	   	session1.setAttribute("productlist", product);
		request.getRequestDispatcher("cartitems.jsp").forward(request, response);
		
	}

}
