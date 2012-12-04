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
import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;
import sa.edu.ksu.psatri.fttxmonit.daos.CFailureDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.GPSPointDAO;


@WebServlet("/showFails")
public class ShowCurrentFailuresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCurrentFailuresServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		try { 
			HttpSession session = request.getSession(true);
			System.out.print("ShowCurrentFailuresServlet: Failures asked by "+ ((UserBean)session.getAttribute("currentSessionUser")).getFullname());
			
			
			// --2. for each one get the precedence list until the splitter
			
			// 5. display the information
			
			// 1. get current failures
			List<CFailureBean> failures = CFailureDAO.listFailures();
			
			// 2. for each failure get the related component and its parent
			Map<String,List<ComponentBean>> map = new HashMap<String, List<ComponentBean>>();
			Iterator<CFailureBean> itr1 = failures.iterator();
			while(itr1.hasNext()) {
				CFailureBean failure = (CFailureBean)itr1.next();
				ComponentBean relatedComponent = ComponentDAO.findComponent(failure.getComponentID());
				failure.setComponent(relatedComponent);
				ComponentBean relatedParent = ComponentDAO.findComponent(relatedComponent.getParentID());
				relatedComponent.setParent(relatedParent);	
				map.putAll( ComponentDAO.listPredecessors(relatedParent.getComponentID()) );
			}
			
			// 3. for each component get the parent, if it's of type FDT stop
			// 4. else, get the precedence list from the parent to the FDT
			if (map!=null){
				for (Map.Entry<String,List<ComponentBean>> entry : map.entrySet()) {
					List<ComponentBean> list = (List<ComponentBean>) entry.getValue();
					Iterator<ComponentBean> itr2 = list.iterator(); 
					while(itr2.hasNext()) {
						ComponentBean element = (ComponentBean)itr2.next();
						element.setGPSPoints(GPSPointDAO.listGPSPoints(element.getComponentID()));
					}
				}
			}
			session.setAttribute("mapComponents",map); // to display on google map
			session.setAttribute("listFailures", failures); // to display info about failures
			response.sendRedirect("curfails.jsp");
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
