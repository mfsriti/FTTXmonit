package sa.edu.ksu.psatri.fttxmonit.daos;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean;
import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;

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
			System.out.println("Add Failure failed: An Exception has occurred! " + e);
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

	public static CFailureBean deleteFailure(CFailureBean bean) {
		
		//This query delete the failure from the database 
		String sqlString = "delete from currentfailures where failureid='" + bean.getFailureID() + "';";
		try {
			int deleteCount = executeDelete(sqlString);
	        
	        if (deleteCount == 0) { 
	        	System.out.println("Sorry, deleting failure fail!");
				bean.setValid(true);
			} else { //if user deleted set isValid variable to false 
				System.out.println("Failure successfully deleted: " + bean.getFailureID() );
				bean.setValid(false); 
			}			
		} catch (Exception e) {
			System.out.println("Deleting a current failure failed: An Exception has occurred! " + e);
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
	
	public static CFailureBean findFailure(int failureId) { 		
		CFailureBean bean = new CFailureBean();
		bean.setFailureID(failureId);
		String sqlString = "select * from currentfailures where failureid='" + failureId + "';";
		try {
	        executeQuery(sqlString);
			boolean more = result.next(); // if user does not exist set the isValid variable to false
			if (!more) { 
				System.out.println("Sorry, the failure \""+failureId +"\"doesn't exist!");
				bean.setValid(false);
			} else { //if failure exists set the isValid variable to true 
				bean.setValid(true); 
				bean.setComponentID(result.getString("ComponentID"));
				bean.setFailureType(result.getString("FailureType"));
				bean.setFailureDate(result.getDate("FailureDate"));
			}			
		} catch (Exception e) {
			System.out.println("Find user failed: An Exception has occurred! " + e);
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
