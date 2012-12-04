package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;
import sa.edu.ksu.psatri.fttxmonit.daos.UserDAO;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			System.out.print("AddUserServlet:"+ request.getParameter("name"));
			UserBean user = new UserBean(); 
			user.setFullname(request.getParameter("name"));
			user.setPassword(request.getParameter("password"));
			user.setTitle(request.getParameter("title"));
			user.setMobile(request.getParameter("mobile"));
			user.setOffice(request.getParameter("office"));
			user.setGroupid(Integer.parseInt(request.getParameter("group")));
			user = UserDAO.addUser(user);
			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("addedUser",user);
				
				//ServletContext sc = getServletContext();  
				//RequestDispatcher rd = sc.getRequestDispatcher("/listUsers");  
				//rd.forward(request, response); 
				
				response.sendRedirect("listUsers"); 
			} else
				response.sendRedirect("listUsers"); 
		} catch (Throwable e) { 
				e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
