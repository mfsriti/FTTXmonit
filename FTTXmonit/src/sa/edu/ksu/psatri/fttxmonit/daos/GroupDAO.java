package sa.edu.ksu.psatri.fttxmonit.daos;

import java.util.ArrayList;
import java.util.List;

import sa.edu.ksu.psatri.fttxmonit.beans.GroupBean;

public class GroupDAO extends CommonDAO{

	public static List<GroupBean> listGroups() { 
		List<GroupBean> listBeans=null;
		
		//This query gathers info. about groups 
		String query = "select * from groups";
		try {
	        executeQuery(query);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, there is no user!");
			} else { //if user exists set the isValid variable to true 
				listBeans = new ArrayList<GroupBean>();
				do {
					GroupBean bean = new GroupBean();			
					bean.setGroupID(result.getInt("GroupID"));
					bean.setGroupName(result.getString("GroupName"));
					listBeans.add(bean);
				} while (result.next());			
			}			
		} catch (Exception e) {
			System.out.println("List Groups failed: An Exception has occurred! " + e);
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
		return listBeans;
	}
}
