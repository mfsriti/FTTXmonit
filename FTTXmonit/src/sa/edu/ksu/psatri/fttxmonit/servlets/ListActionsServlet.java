package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.ActionBean;
import sa.edu.ksu.psatri.fttxmonit.beans.GroupBean;
import sa.edu.ksu.psatri.fttxmonit.daos.ActionDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.GroupDAO;

/**
 * Servlet implementation class ListActionsServlet
 */
@WebServlet("/listActions")
public class ListActionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListActionsServlet() {
        super();      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			List<ActionBean> list = ActionDAO.listActions();
			HttpSession session = request.getSession(true);
			session.setAttribute("listActions",list); 
			response.sendRedirect("actions.jsp"); 
		} catch (Throwable e) { 
				e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
