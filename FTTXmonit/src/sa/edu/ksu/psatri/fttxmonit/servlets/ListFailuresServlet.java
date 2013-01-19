package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean;
import sa.edu.ksu.psatri.fttxmonit.beans.RFailureBean;
import sa.edu.ksu.psatri.fttxmonit.daos.CFailureDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.RFailureDAO;

/**
 * Servlet implementation class ShowResolvedFailuresServlet
 */
@WebServlet("/listFails")
public class ListFailuresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListFailuresServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			List<CFailureBean> currentFailures = null;
			List<RFailureBean> resolvedfailures = null;
			if (request.getParameter("type").equals("Current"))
				currentFailures = CFailureDAO.listFailures();
			else
				resolvedfailures = RFailureDAO.listFailures();
		
			// save the two lists
			HttpSession session = request.getSession(true);
			session.setAttribute("currentFailures", currentFailures);
			session.setAttribute("resolvedfailures", resolvedfailures);
		
			// redirect
			response.sendRedirect("failures.jsp");
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
