package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
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
import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.GPSPointDAO;

/**
 * Servlet implementation class ShowKeyMap
 */
@WebServlet("/showKM")
public class ShowKeyMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowKeyMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		try { 
			HttpSession session = request.getSession(true);
			System.out.print("ShowKeyMapServlet: Map asked by "+ ((UserBean)session.getAttribute("currentSessionUser")).getFullname());
			
			Map<String,List<ComponentBean>> map = ComponentDAO.listVisibleComponents();
			if (map!=null){
				for (Map.Entry<String,List<ComponentBean>> entry : map.entrySet()) {
					List<ComponentBean> list = (List<ComponentBean>) entry.getValue();
					Iterator<ComponentBean> itr = list.iterator(); 
					while(itr.hasNext()) {
						ComponentBean element = (ComponentBean)itr.next();
						element.setGPSPoints(GPSPointDAO.listGPSPoints(element.getComponentID()));
					}
				}
			}
			session.setAttribute("mapComponents",map); 
			response.sendRedirect("keymap.jsp");
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
