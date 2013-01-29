<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="sa.edu.ksu.psatri.fttxmonit.beans.UserBean, java.util.Map, java.util.List"%>

<div class="container">
	<ul>

<%!
class ElemMenuInf{
	String elemId;
	String elemAction;
	String elemLabel;
	public ElemMenuInf(String id, String action, String label){
		elemId = id;
		elemAction = action;
		elemLabel = label;
	}
}
public String getLinkClass(String curItemId, String tabId){
	return curItemId.equals(tabId) ? "current" : "";
}
public void displayTabs(HttpSession session, javax.servlet.jsp.JspWriter out, 
		                String menuItem, String [][] tabs, String itemId, String tabId) throws java.io.IOException{
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	List<String> authorizedActions = currentUser.getActionList().get(menuItem);
	for(int i=0; i<tabs.length; i++){
		if (authorizedActions.contains(tabs[i][0]))
			out.print("<li><a id=\""+"tab"+i+" href=\"javascript:void(0);\" class=\""+getLinkClass("tab"+i,  tabId)+"\" onclick=\"onClickTab('"+itemId+"','"+"tab"+i+"', '"+tabs[i][1]+"')\"><span>"+tabs[i][2]+"</span></a></li>");
	}
}
%>

<%
UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
String group = currentUser.getGroupname();
String itemId = (String) request.getParameter("itemId");
String tabId = (String) request.getParameter("tabId");
String [][] tabs = null;
String actionType=null;

if (itemId.equals("one")){ 
	tabs = new String[][]{{"Home","homecontent.jsp","Home"}};
	actionType = "Home";
} else if (itemId.equals("two")){ 
	tabs = new String[][]{{"View Key Map","showKM","Key Map"}, {"View/Update SLD","showSLD","SLD Schema"} };
	actionType = "KeyMap";
} else if (itemId.equals("three")){ 
	tabs = new String[][]{{"See Current Failures","displayFails","Display Failures"}, {"See Current Failures","listFails?type=Current","Current Failures"}, {"See Resolved Failures","listFails?type=Resolved","Resolved Failures"} };
	actionType = "Failures";
} else if (itemId.equals("four")){
	tabs = new String[][]{{"See Tabular Reports","chartReport","Chart Report"}, {"See Textual Reports","pieReport","Pie Report"}, {"See Tabular Reports","counterReport","Failures Counters"}, {"See Textual Reports","spareReport","Spare Capacities"} };
	actionType = "Reports";
} else if (itemId.equals("five")){ 
	tabs = new String[][]{{"Create User","listUsers","Users"}, {"Create User","listGroups","Groups"}, {"Create User","listActions","Actions"}};
	actionType = "Users";
} else if (itemId.equals("six")){
	tabs = new String[][]{{"Backup","localbackup.jsp","Local Backup"}, {"Backup","serverbackup.jsp","Server Backup"} };
	actionType = "Backup";
} else if (itemId.equals("seven")){ 
	tabs = new String[][]{{"Configuration","reportconfig.jsp","Reports Configuration"}, {"Configuration","aclconfig.jsp","ACL Configuration"}, {"Configuration","typeconfig.jsp","Component Types Management"} };
	actionType = "Configuration";	
} else if (itemId.equals("eight")){
	tabs = new String[][]{{"Preferences","generalprefs.jsp","General Preferences"}, {"Preferences","displayprefs.jsp","Display Preferences"} };
	actionType = "Preferences";
} else if (itemId.equals("nine")) {
	tabs = new String[][]{{"Help","help.jsp","Help Contents"} };
	actionType = "Help";
}
displayTabs(session, out, actionType, tabs, itemId, tabId);
%>
	</ul>
</div>
<script type="text/javascript">
if (tabId=="tab0" && <%=tabs!=null%>)
	changeElement("content", <%=tabs[0][1]%>, ""); // doesn't work 
</script>
