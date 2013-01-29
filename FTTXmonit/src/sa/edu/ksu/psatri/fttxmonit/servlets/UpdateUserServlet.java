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
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			System.out.print("UpdateUserServlet:"+ request.getParameter("userId"));
			
			UserBean user = new UserBean(); 
			user.setUsername(request.getParameter("userId"));
			user.setFullname(request.getParameter("name"));
			user.setPassword(request.getParameter("password"));
			user.setTitle(request.getParameter("title"));
			user.setMobile(request.getParameter("mobile"));
			user.setOffice(request.getParameter("office"));
			user.setGroupid(Integer.parseInt(request.getParameter("group")));
			user = UserDAO.updateUser(user);
			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("updatedUser",user);				
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
