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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			UserBean user = new UserBean(); 
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user = UserDAO.login(user);
			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser",user);
			if (user.isValid()) {
				//response.sendRedirect("userLogged.jsp"); 
				response.sendRedirect("home.jsp"); 
			} else
				response.sendRedirect("index.jsp"); 
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
