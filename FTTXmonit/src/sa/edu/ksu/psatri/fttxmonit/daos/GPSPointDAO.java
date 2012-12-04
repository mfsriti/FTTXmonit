package sa.edu.ksu.psatri.fttxmonit.daos;


public class GPSPointDAO extends CommonDAO {
	
	public static float [][] listGPSPoints(String compId){
		float [][] arrPoints = null;
		String sqlString = "select * from GPSPoints where ComponentID='"+compId+"'";
		try {
			executeQuery(sqlString);
			int rowcount = 0;
			if (result.last()) {
			  rowcount = result.getRow();
			  result.beforeFirst();
			}
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no GPSPoint found for the component: "+ compId);
			} else { 			
				arrPoints =  new float[rowcount][2];
				do {
					int order = result.getInt("PointOrder");
					arrPoints[order][0]=result.getFloat("Latitude")/1000000;
					arrPoints[order][1]=result.getFloat("Longitude")/1000000;
				} while (result.next());				
			}			
		} catch (Exception e) {
			System.out.println("List GPSPoint failed: An Exception has occurred! " + e);
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
