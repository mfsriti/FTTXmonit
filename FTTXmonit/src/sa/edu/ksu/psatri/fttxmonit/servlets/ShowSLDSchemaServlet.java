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
import sa.edu.ksu.psatri.fttxmonit.daos.SLDPointDAO;

/**
 * Servlet implementation class ShowSLDSchema
 */
@WebServlet("/showSLD")
public class ShowSLDSchemaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSLDSchemaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			HttpSession session = request.getSession(true);
			System.out.print("ShowSLDServlet: SLD Shcema asked by "+ ((UserBean)session.getAttribute("currentSessionUser")).getFullname());
			
			Map<String,List<ComponentBean>> map = ComponentDAO.listVisibleComponents();
			if (map!=null){
				List<ComponentBean> list = map.get("FDT");
				list.addAll(map.get("Cable"));
				Iterator<ComponentBean> itr = list.iterator(); 
				while(itr.hasNext()) {
					ComponentBean element = (ComponentBean)itr.next();
					element.setSLDPoints(SLDPointDAO.listSLDPoints(element.getComponentID())); // le mieux est d'utiliser un cache dans SLDPointDAO map id->arraysldpoints et ajouter a cette fonction un attr boolean indiquant utiliser le cache s'il existe ou pas
					if (element.getComponentTypeName().equals("FDT")){
						String predecessorId = ComponentDAO.findPredecessor(element.getComponentID());
						int[][] predSLDPoints = SLDPointDAO.listSLDPoints(predecessorId);
						int coordX = element.getCoordX();
						int coordY = element.getCoordY();
						boolean vertical = (predSLDPoints[predSLDPoints.length-1][0]==predSLDPoints[predSLDPoints.length-2][0]);
						if (vertical){
							if (coordY > predSLDPoints[predSLDPoints.length-2][1])
								element.setSldPosition(180);
							else
								element.setSldPosition(0);
						} else {
							if(coordX > predSLDPoints[predSLDPoints.length-2][0])
								element.setSldPosition(90);
							else
								element.setSldPosition(270);
						}
					}
					
				}
				/*
				for (Map.Entry<String,List<ComponentBean>> entry : map.entrySet()) {
					List<ComponentBean> list = (List<ComponentBean>) entry.getValue();
					Iterator<ComponentBean> itr = list.iterator(); 
					while(itr.hasNext()) {
						ComponentBean element = (ComponentBean)itr.next();
						String cType = element.getComponentTypeName();
						if (cType.equals("Cable") || cType.equals("FDT"))
							element.setSLDPoints(SLDPointDAO.listSLDPoints(element.getComponentID()));
					}
				}
				*/
			}
			session.setAttribute("mapComponents",map); 
			response.sendRedirect("sldschema.jsp");
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
