package sa.edu.ksu.psatri.fttxmonit.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sa.edu.ksu.psatri.fttxmonit.beans.ReportStats2Bean;

public class ReportStats2DAO extends CommonDAO {
	public static Map<String,ReportStats2Bean> listStatsByComponent(){ 
		Map<String,ReportStats2Bean> tmpList = null;
		String sqlString = "select ComponentId, SUM(FailureCounter) AS FailureCounter, SUM(SpareCapacity) AS SpareCapacity from ReportStats2 GROUP BY ComponentId";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("listStatsByComponent: Sorry, no Stats found");
			} else { 			
				tmpList = new HashMap<String,ReportStats2Bean>();
				do {
					ReportStats2Bean bean = new ReportStats2Bean();
					//bean.setStatID(result.getInt("StatID"));
					bean.setComponentID(result.getString("ComponentId"));
					bean.setFailureCounter(result.getInt("FailureCounter"));
					bean.setSpareCapacity(result.getInt("SpareCapacity"));
					tmpList.put(bean.getComponentID(), bean);
				} while (result.next());		
			}			
		} catch (Exception e) {
			System.out.println("listStatsByComponent failed: An Exception has occurred! " + e);
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
