package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;
import sa.edu.ksu.psatri.fttxmonit.daos.UserDAO;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			System.out.print("DeleteUserServlet:"+ request.getParameter("userId"));
			
			UserBean user = new UserBean(); 
			user.setUsername(request.getParameter("userId"));
			user = UserDAO.deleteUser(user);
			if (!user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("deletedUser",user);				
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
		// TODO Auto-generated method stub
	}

}
