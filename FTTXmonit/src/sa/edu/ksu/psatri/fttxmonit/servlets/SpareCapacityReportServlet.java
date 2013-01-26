package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.ArrayList;
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

import sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean;
import sa.edu.ksu.psatri.fttxmonit.beans.ReportStats2Bean;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.GPSPointDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.ReportStats2DAO;

/**
 * Servlet implementation class SpareCapacityReportServlet
 */
@WebServlet("/spareReport")
public class SpareCapacityReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpareCapacityReportServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// get list failures stats
			Map<String, ReportStats2Bean> mapStats = ReportStats2DAO.listStatsByComponent();
		
			// get list component related to the stats
			Map<String, List<ComponentBean>> mapComponents = ComponentDAO.listVisibleComponents();
			if (mapComponents!=null){
				for (Map.Entry<String,List<ComponentBean>> entry : mapComponents.entrySet()) {
					List<ComponentBean> list = (List<ComponentBean>) entry.getValue();
					Iterator<ComponentBean> itr = list.iterator(); 
					while(itr.hasNext()) {
						ComponentBean element = (ComponentBean)itr.next();
						element.setGPSPoints(GPSPointDAO.listGPSPoints(element.getComponentID()));
					}
				}
			}
			
			// put two lists in the session
			HttpSession session = request.getSession(true);
			session.setAttribute("mapStats", mapStats);
			session.setAttribute("mapComponents", mapComponents);
			
			response.sendRedirect("countersparereport.jsp?type=spare");
		} catch (Throwable e){
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
