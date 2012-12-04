package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean;
import sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean;
import sa.edu.ksu.psatri.fttxmonit.beans.ReportStatsBean;
import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;
import sa.edu.ksu.psatri.fttxmonit.daos.CFailureDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.GPSPointDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.ReportStatsDAO;


@WebServlet("/pieReport")
public class PieReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PieReportServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		try { 
			HttpSession session = request.getSession(true);
			System.out.print("PieReportServlet: Stats asked by "+ ((UserBean)session.getAttribute("currentSessionUser")).getFullname());
			List<ReportStatsBean> stats = ReportStatsDAO.listStatsByType();
			session.setAttribute("listStats",stats); 
			response.sendRedirect("piereports.jsp");
		} catch (Throwable e) { 
				e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

}
