package sa.edu.ksu.psatri.fttxmonit.daos;

import java.util.ArrayList;
import java.util.List;

import sa.edu.ksu.psatri.fttxmonit.beans.ComponentTypeBean;

public class ComponentTypeDAO extends CommonDAO {
	public static List<ComponentTypeBean> listTypes(){
		List<ComponentTypeBean> tmpList = null;
		String sqlString = "select * from ComponentTypes";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no component type found");
			} else { 			
				tmpList = new ArrayList<ComponentTypeBean>();
				do {
					ComponentTypeBean bean = new ComponentTypeBean();
					bean.setComponentTypeID(result.getInt("ComponentTypeID"));
					bean.setComponentTypeName(result.getString("ComponentTypeName"));
					bean.setDescription(result.getString("Description"));
					tmpList.add(bean);
				} while (result.next());		
			}			
		} catch (Exception e) {
			System.out.println("List Comopnent Types failed: An Exception has occurred! " + e);
		} finally { 
			if (result != null) { 
				try { 
					result.close(); 
				} catch (Exception e) {
				}
			    result = null; 
			} 
			if (stmt != null) { 
				try { 
					stmt.close(); 
				} catch (Exception e) {
			    } 
				stmt = null;
			} 
			if (currentCon != null) { 
				try { currentCon.close(); 
				} catch (Exception e) {
				} 
				currentCon = null; 
			} 
		} 
		return tmpList; 
	}
}
