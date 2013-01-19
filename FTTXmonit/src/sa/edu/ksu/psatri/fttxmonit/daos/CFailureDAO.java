package sa.edu.ksu.psatri.fttxmonit.daos;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean;

public class CFailureDAO extends CommonDAO {
	public static List<CFailureBean> listFailures(){
		List<CFailureBean> tmpList = null;
		String sqlString = "select * from CurrentFailures";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no failure found");
			} else { 			
				tmpList = new ArrayList<CFailureBean>();
				do {
					CFailureBean bean = new CFailureBean();
					bean.setComponentID(result.getString("ComponentID"));
					bean.setFailureID(result.getInt("FailureID"));
					bean.setFailureType(result.getString("FailureType"));
					bean.setFailureDate(result.getDate("FailureDate"));
					tmpList.add(bean);
				} while (result.next());		
			}			
		} catch (Exception e) {
			System.out.println("List Failures failed: An Exception has occurred! " + e);
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
	
	public static CFailureBean addFailure(CFailureBean bean){
		String sqlString = "INSERT INTO CurrentFailures (FailureDate,FailureType,ComponentID) VALUES ('"+new Date(bean.getFailureDate().getTime()).toString()+"', '"+bean.getFailureType()+"', '"+bean.getComponentID()+"');";
		try {
		        executeInsertAutoGenKeys(sqlString);
		        boolean more = result.next();
		        if (!more) { 
		        	System.out.println("Sorry, adding new failure fails!");
					bean.setValid(false);
				} else { 
					int failureId = result.getInt(1); 
					System.out.println("New failure added with ID:" + failureId );
					bean.setFailureID(failureId);
					bean.setValid(true); 
				}			
		} catch (Exception e) {
			System.out.println("List Failures failed: An Exception has occurred! " + e);
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
		return bean; 
	}
}
