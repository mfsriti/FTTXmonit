package sa.edu.ksu.psatri.fttxmonit.daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean;

public class ComponentDAO extends CommonDAO {
	public static Map<String, List<ComponentBean>> listVisibleComponents(){
		String types = "('FDT', 'Hole', 'Cable', 'ODB', 'ONT', 'Splice')";
		return listComponents(types);
	}
	private static ComponentBean getBean() throws SQLException {
		ComponentBean bean = new ComponentBean();
		bean.setComponentID(result.getString("ComponentID"));
		bean.setComponentTypeName(result.getString("ComponentTypeName"));
		bean.setAddress(result.getString("Address"));
		bean.setAreaID(result.getString("AreaID"));
		bean.setComponentSignature(result.getInt("ComponentSignature"));
		bean.setCoordX(result.getInt("CoordX"));
		bean.setCoordY(result.getInt("CoordY"));
		bean.setDistanceFromOLT(result.getFloat("DistanceFromOLT"));
		bean.setLatitude(result.getFloat("Latitude")/1000000);
		bean.setLongitude(result.getFloat("Longitude")/1000000);
		bean.setParentID(result.getString("ParentID"));
		bean.setQuarterNames(result.getString("QuarterNames"));
		bean.setSize(result.getInt("Size"));
		return bean;
	}
	/**
	 * In the future we can enhance the use of this method by specifying the concerned user in parameters.
	 * After this, we can filter the component to be viewed according his authorizations and/or preferences
	 * @return
	 */
	public static Map<String, List<ComponentBean>> listComponents(String includedTypes){
		Map<String, List<ComponentBean>> tmpMap = null;
		String typeFilter = (includedTypes == null) ? "" : " and componentTypeName IN "+ includedTypes;
		//This query gathers info. about the user, user group and user's access rights 
		String sqlString = "select * from components, componenttypes where components.componentTypeId=componenttypes.componentTypeId"+typeFilter;
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no object of type components in the database.");
			} else { 				
				tmpMap = new HashMap<String, List<ComponentBean>>();
				
				do {
					ComponentBean bean = getBean();
					String componentTypeName = bean.getComponentTypeName();				
					if (! tmpMap.containsKey(componentTypeName))
						tmpMap.put(componentTypeName, new ArrayList<ComponentBean>());
					tmpMap.get(componentTypeName).add(bean);
			
				} while (result.next());				
			}			
		} catch (Exception e) {
			System.out.println("List Component failed: An Exception has occurred! " + e);
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
		return tmpMap; 
	}
	
	public static List<ComponentBean> listComponentsByTypeID(String typeId){
		List<ComponentBean> tmpList = null;
		String sqlString = "select * from components, componenttypes where components.componentTypeId=componenttypes.componentTypeId and components.componentTypeId="+typeId;
		System.out.println(sqlString);
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no object of type components in the database.");
			} else { 				
				tmpList = new ArrayList<ComponentBean>();
				
				do {
					ComponentBean bean = getBean();
					tmpList.add(bean);
				} while (result.next());				
			}			
		} catch (Exception e) {
			System.out.println("List Component failed: An Exception has occurred! " + e);
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
	
	public static ComponentBean findComponent(String compId){
		ComponentBean bean = null;
		String sqlString = "select * from components, componenttypes where components.componentTypeId=componenttypes.componentTypeId and components.componentId='"+compId+"'";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no object found with componentId=" + compId);
			} else { 				
					bean = getBean();							
			}			
		} catch (Exception e) {
			System.out.println("Find Component failed: An Exception has occurred! " + e);
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
	
	//result include the compId object
	public static Map<String, List<ComponentBean>> listPredecessors(String compId){
		Map<String, List<ComponentBean>> tmpMap = null;
		String sqlString = "call findPredecessors('"+compId+"')";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no object of type components in the database.");
			} else { 				
				tmpMap = new HashMap<String, List<ComponentBean>>();
				
				do {
					ComponentBean bean = getBean();
					String componentTypeName = bean.getComponentTypeName();				
					if (! tmpMap.containsKey(componentTypeName))
						tmpMap.put(componentTypeName, new ArrayList<ComponentBean>());
					tmpMap.get(componentTypeName).add(bean);
			
				} while (result.next());				
			}					
		} catch (Exception e) {
			System.out.println("List Predecessors failed: An Exception has occurred! " + e);
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
		return tmpMap; 
	}

	public static String findPredecessor(String compId){
		String predId = null;
		String sqlString = "select * from Predecessors where ComponentID='"+compId+"'";
		try {
			executeQuery(sqlString);
			boolean more = result.next(); 
			if (!more) { 
				System.out.println("Sorry, no Predecessor found for the component: "+ compId);
			} else { 			
				predId = result.getString("PredecessorId");			
			}			
		} catch (Exception e) {
			System.out.println("Find Predecessor failed: An Exception has occurred! " + e);
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
		return predId; 
	}
}
