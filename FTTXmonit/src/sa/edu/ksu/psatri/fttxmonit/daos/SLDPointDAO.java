package sa.edu.ksu.psatri.fttxmonit.daos;


public class SLDPointDAO extends CommonDAO {
	
	public static int [][] listSLDPoints(String compId){
		int [][] arrPoints = null;
		String sqlString = "select * from SLDPoints where ComponentID='"+compId+"'";
		try {
			executeQuery(sqlString);
			int rowcount = 0;
			if (result.last()) {
			  rowcount = result.getRow();
			  result.beforeFirst();
			}
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no SLDPoint found for the component: "+ compId);
			} else { 			
				arrPoints =  new int[rowcount][2];
				do {
					int order = result.getInt("PointOrder");
					arrPoints[order][0]=result.getInt("CoordX");
					arrPoints[order][1]=result.getInt("CoordY");
				} while (result.next());				
			}			
		} catch (Exception e) {
			System.out.println("List SLDPoints failed: An Exception has occurred! " + e);
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
		return arrPoints; 
	}
}
