package sa.edu.ksu.psatri.fttxmonit.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean;
import sa.edu.ksu.psatri.fttxmonit.beans.ComponentTypeBean;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentDAO;
import sa.edu.ksu.psatri.fttxmonit.daos.ComponentTypeDAO;

/**
 * Servlet implementation class LoadComponentTypesServlet
 */
@WebServlet("/loadComponents")
public class LoadComponentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadComponentsServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
			HttpSession session = request.getSession(true);
			String typeId = request.getParameter("ComponentTypeId");
			List<ComponentBean> list = ComponentDAO.listComponentsByTypeID(typeId);
			session.setAttribute("listComponents", list); // to display info about failures
			response.sendRedirect("components.jsp");
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
