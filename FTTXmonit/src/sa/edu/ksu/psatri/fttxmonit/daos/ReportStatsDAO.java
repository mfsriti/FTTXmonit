package sa.edu.ksu.psatri.fttxmonit.daos;

import java.util.ArrayList;
import java.util.List;

import sa.edu.ksu.psatri.fttxmonit.beans.ReportStatsBean;

public class ReportStatsDAO extends CommonDAO {
	public static List<ReportStatsBean> listStatsByType(){
		List<ReportStatsBean> tmpList = null;
		String sqlString = "select StatComponentTypename, SUM(StatNumber) AS StatNumber from ReportStats GROUP BY StatComponentTypename";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no Stats found");
			} else { 			
				tmpList = new ArrayList<ReportStatsBean>();
				do {
					ReportStatsBean bean = new ReportStatsBean();
					//bean.setStatID(result.getInt("StatID"));
					//bean.setStatMounth(result.getDate("StatMounth"));
					bean.setStatComponentTypeName(result.getString("StatComponentTypeName"));
					bean.setStatNumber(result.getInt("StatNumber"));
					tmpList.add(bean);
				} while (result.next());		
			}			
		} catch (Exception e) {
			System.out.println("List Stats By Type failed: An Exception has occurred! " + e);
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
	
	public static List<ReportStatsBean> listStatsByMounth(){
		List<ReportStatsBean> tmpList = null;
		String sqlString = "select StatMounth, SUM(StatNumber) AS StatNumber from ReportStats GROUP BY StatMounth ORDER BY StatMounth";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no Stats found");
			} else { 			
				tmpList = new ArrayList<ReportStatsBean>();
				do {
					ReportStatsBean bean = new ReportStatsBean();
					//bean.setStatID(result.getInt("StatID"));
					bean.setStatMounth(result.getDate("StatMounth"));
					//bean.setStatComponentTypeName(result.getString("StatComponentTypeName"));
					bean.setStatNumber(result.getInt("StatNumber"));
					tmpList.add(bean);
				} while (result.next());		
			}			
		} catch (Exception e) {
			System.out.println("List Stats By Mounth failed: An Exception has occurred! " + e);
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
