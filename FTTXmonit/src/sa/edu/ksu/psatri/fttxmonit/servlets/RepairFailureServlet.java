package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.common.base.Strings;

import sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean;
import sa.edu.ksu.psatri.fttxmonit.beans.RFailureBean;
import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;
import sa.edu.ksu.psatri.fttxmonit.daos.CFailureDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.RFailureDAO;

/**
 * Servlet implementation class RepairFailureServlet
 */
@WebServlet("/repairFail")
public class RepairFailureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepairFailureServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			UserBean user;
			HttpSession session = request.getSession(true);
			user = (UserBean) session.getAttribute("currentSessionUser");
			
			//supprimer la failure de cfail table
			CFailureBean cbean = CFailureDAO.findFailure(Integer.parseInt(request.getParameter("id")));
			cbean = CFailureDAO.deleteFailure(cbean);
			
			if (!cbean.isValid()) {
				session.setAttribute("deletedFailure",cbean);				
				
				//ajouter une failure reparer dans la rfail table
				RFailureBean rbean = new RFailureBean();
				rbean.setFailureDate(cbean.getFailureDate());
				rbean.setFailureType(cbean.getFailureType());
				rbean.setComponentID(cbean.getComponentID());
				rbean.setTechRepairDate(new Date());
				rbean.setResolverID(Integer.parseInt(user.getUsername()));
				rbean.setAutoRepairDate(null);
				rbean = RFailureDAO.addFailure(rbean);
				if (rbean.isValid())
					session.setAttribute("resolvedFailure",rbean);	
			
			} 
			//puis redirect vers la servlet listFail sans oublier de mettre le parametter current
			response.sendRedirect("listFails?type=Current");
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
