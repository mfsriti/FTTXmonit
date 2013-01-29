package sa.edu.ksu.psatri.fttxmonit.daos;

import java.util.*;

import sa.edu.ksu.psatri.fttxmonit.beans.UserBean;

public class UserDAO extends CommonDAO { 

	public static UserBean login(UserBean bean) { 		
		String username = bean.getUsername(); 
		String password = bean.getPassword(); 
		
		//This query gathers info. about the user, user group and user's access rights 
		String sqlString = "select * from users, groups, actions, acl where UserId='" + username + "' AND Password='" + password +
				"' AND users.GroupId=groups.GroupId AND groups.GroupId=acl.GroupId AND actions.ActionID=acl.ActionId;";
		try {
	        executeQuery(sqlString);
			boolean more = result.next(); // if user does not exist set the isValid variable to false
			if (!more) { 
				System.out.println("Sorry, you are not a registered user! Please sign up first");
				bean.setValid(false);
			} else { //if user exists set the isValid variable to true 
				String fullname = result.getString("FullName"); 
				System.out.println("Welcome " + fullname);
				bean.setFullname(fullname);
				bean.setValid(true); 
				bean.setGroupid(result.getInt("groupId"));
				bean.setGroupname(result.getString("GroupName"));
				bean.setMobile(result.getString("mobile"));
				bean.setOffice(result.getString("office"));
				bean.setTitle(result.getString("title"));
				Map<String, List<String>> tmpMap = new HashMap<String, List<String>>();
				String actionName;
				String actionType;
				do {
					actionName = result.getString("ActionName");
					actionType = result.getString("ActionType");
					if (! tmpMap.containsKey(actionType))
						tmpMap.put(actionType, new ArrayList<String>());
					tmpMap.get(actionType).add(actionName);
			    } while (result.next());
				bean.setActionList(tmpMap);				
			}			
		} catch (Exception e) {
			System.out.println("Log In failed: An Exception has occurred! " + e);
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
	
	public static UserBean findUser(String username) { 		
		UserBean bean = new UserBean();
		bean.setUsername(username);
		String sqlString = "select * from users where UserId='" + username + "';";
		try {
	        executeQuery(sqlString);
			boolean more = result.next(); // if user does not exist set the isValid variable to false
			if (!more) { 
				System.out.println("Sorry, the user \""+username+"\"is not registered!");
				bean.setValid(false);
			} else { //if user exists set the isValid variable to true 
				String fullname = result.getString("FullName"); 
				System.out.println("Welcome " + fullname);
				bean.setFullname(fullname);
				bean.setValid(true); 
				bean.setGroupid(result.getInt("groupId"));
				bean.setMobile(result.getString("mobile"));
				bean.setOffice(result.getString("office"));
				bean.setTitle(result.getString("title"));
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
	
	public static List<UserBean> listUsers() { 
		List<UserBean> listBeans=null;
		
		//This query gathers info. about the user, user group and user's access rights 
		String sqlString = "select * from users, groups where users.GroupId=groups.GroupId";
		try {
            executeQuery(sqlString);
			boolean more = result.next();
			if (!more) { 
				System.out.println("Sorry, there is no user!");
			} else { 
				listBeans = new ArrayList<UserBean>();
				do {
					UserBean bean = new UserBean();			
					bean.setUsername(result.getString("UserID"));
					bean.setFullname(result.getString("FullName"));
					bean.setTitle(result.getString("Title"));
					bean.setMobile(result.getString("Mobile"));
					bean.setMobile(result.getString("Office"));
					bean.setGroupid(result.getInt("groupId"));
					bean.setGroupname(result.getString("GroupName"));

					listBeans.add(bean);
				} while (result.next());			
			}			
		} catch (Exception e) {
			System.out.println("List Users failed: An Exception has occurred! " + e);
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
	public static UserBean addUser(UserBean bean) {
		//This query gathers info. about the user, user group and user's access rights 
		String sqlString = "insert into users (Title, Password, GroupID, FullName, Mobile, Office) values ('"
				+ bean.getTitle() + "','" + bean.getPassword() + "'," +bean.getGroupid() + ",'" 
				+ bean.getFullname() +"','" + bean.getMobile() + "','"+bean.getOffice() + "')";
		try {
	        executeInsertAutoGenKeys(sqlString);
	        boolean more = result.next();
	        if (!more) { 
	        	System.out.println("Sorry, adding new user fail!");
				bean.setValid(false);
			} else { //if user exists set the isValid variable to true 
				int username = result.getInt(1); 
				//String password = result.getString("Password");
				System.out.println("New user added with ID:" + username );
				bean.setUsername(String.valueOf(username));
				bean.setValid(true); 
			}			
		} catch (Exception e) {
			System.out.println("Adding new user failed: An Exception has occurred! " + e);
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

	public static UserBean updateUser(UserBean bean) {
		String sqlString = "update users set Title='" + bean.getTitle() + "', Password='" + bean.getPassword() 
				+ "', GroupID=" + bean.getGroupid() + ", FullName='" + bean.getFullname() 
				+ "', Mobile='" + bean.getMobile() + "', Office='" + bean.getOffice()
				+ "' where userId="+bean.getUsername()+";";
		try {
			int updateCount = executeUpdate(sqlString);
	        
	        if (updateCount == 0) { 
	        	System.out.println("updateUser: Sorry, updating user fail!");
				bean.setValid(false);
			} else {
				System.out.println("updateUser: User successfully updated: " + bean.getUsername() );
				bean.setValid(true); 
			}			
		} catch (Exception e) {
			System.out.println("Updating user failed: An Exception has occurred! " + e);
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
	
public static UserBean deleteUser(UserBean bean) {
	//This query delete the user from the database 
	String sqlString = "delete from users where UserId='" + bean.getUsername() + "';";
	try {
		int deleteCount = executeDelete(sqlString);
        
        if (deleteCount == 0) { 
        	System.out.println("Sorry, deleting user fail!");
			bean.setValid(true);
		} else { //if user deleted set isValid variable to false 
			System.out.println("User successfully deleted: " + bean.getUsername() );
			bean.setValid(false); 
		}			
	} catch (Exception e) {
		System.out.println("Deleting a user failed: An Exception has occurred! " + e);
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
			
			
		
	
