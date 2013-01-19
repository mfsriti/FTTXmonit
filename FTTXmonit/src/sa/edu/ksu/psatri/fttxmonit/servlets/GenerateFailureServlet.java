package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean;
import sa.edu.ksu.psatri.fttxmonit.beans.ComponentTypeBean;
import sa.edu.ksu.psatri.fttxmonit.daos.CFailureDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentTypeDAO;

/**
 * Servlet implementation class GenerateFailureServlet
 */
@WebServlet("/genFails")
public class GenerateFailureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateFailureServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			CFailureBean bean = new CFailureBean();
			bean.setComponentID(request.getParameter("componentid"));
			bean.setFailureType("manual test");
			bean.setFailureDate((new Date()));
			bean.setValid(false);
			if (bean.getComponentID() != null && !bean.getComponentID().isEmpty())
				CFailureDAO.addFailure(bean);
			HttpSession session = request.getSession(true);
			session.setAttribute("addedFailure",bean);	
			response.sendRedirect("test.jsp");
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
