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
 * Servlet implementation class FailuresCountersReportServlet
 */
@WebServlet("/counterReport")
public class FailuresCountersReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FailuresCountersReportServlet() {
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
			Map<String, List<ComponentBean>> mapComponents = new HashMap<String, List<ComponentBean>>();
			
			for (Map.Entry<String, ReportStats2Bean> entry : mapStats.entrySet()) {
				ComponentBean bean = ComponentDAO.findComponent(entry.getKey());
				if (entry.getValue().getFailureCounter() >0) {
					bean.setGPSPoints(GPSPointDAO.listGPSPoints(bean.getComponentID()));
					if (!mapComponents.containsKey(bean.getComponentTypeName()))
						mapComponents.put(bean.getComponentTypeName(), new ArrayList<ComponentBean>());
					mapComponents.get(bean.getComponentTypeName()).add(bean);
				}
			}
			
			// put two lists in the session
			HttpSession session = request.getSession(true);
			session.setAttribute("mapStats", mapStats);
			session.setAttribute("mapComponents", mapComponents);
			
			response.sendRedirect("countersparereport.jsp?type=counter");
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
