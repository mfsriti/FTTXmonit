<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="sa.edu.ksu.psatri.fttxmonit.beans.UserBean, java.util.Map, java.util.List"%>
	
<%!
public String getLinkClass(String curItemId, HttpServletRequest request) {
	return curItemId.equals(request.getParameter("itemId")) ? "main current" : "main";
}
%>

<ul class="group" id="menu_group_main">
<%
UserBean currentUser = (UserBean) (session
		.getAttribute("currentSessionUser"));

class ElemMenuInf{
	String elemId;
	String elemCSSClass;
	String elemLabel;
	public ElemMenuInf(String id, String CSSClass, String label){
		elemId = id;
		elemCSSClass = CSSClass;
		elemLabel = label;
	}
}

int elemMenuSize = currentUser.getActionList().size(); 
ElemMenuInf [] menu = new ElemMenuInf[elemMenuSize];
int i=0;
if (currentUser.getActionList().containsKey("Home")){
	menu[i++] = new ElemMenuInf("one","dashboard","Home");
}
if (currentUser.getActionList().containsKey("KeyMap")){
	menu[i++] = new ElemMenuInf("two","map","KeyMap / SLD");
}
if (currentUser.getActionList().containsKey("Failures")){
	menu[i++] = new ElemMenuInf("three","event_manager","Events / Failures");
}
if (currentUser.getActionList().containsKey("Reports")){
	menu[i++] = new ElemMenuInf("four","reports png","Reports");
}
if (currentUser.getActionList().containsKey("Users")){
	menu[i++] = new ElemMenuInf("five","users","Users");
}
if (currentUser.getActionList().containsKey("Backup")){
	menu[i++] = new ElemMenuInf("six","backup","Backup");
}
if (currentUser.getActionList().containsKey("Configuration")){
	menu[i++] = new ElemMenuInf("seven","configuration","Configuration");
}
if (currentUser.getActionList().containsKey("Preferences")){
	menu[i++] = new ElemMenuInf("eight","preferences","Preferences");
}
if (currentUser.getActionList().containsKey("Help")){
	menu[i++] = new ElemMenuInf("nine","help","Help");
}

for (i=0; i<elemMenuSize; i++){
	String liClass = ( (i==0) ? "first" : ( (i==elemMenuSize-1) ? "last" : "middle") );
	out.print("<li class=\"item "+liClass+"\" id=\""+menu[i].elemId+"\">");
 	out.print("<a href=\"javascript:void(0);\" class=\""+getLinkClass(menu[i].elemId,  request)+"\" onclick=\"onClickMenu('"+menu[i].elemId+"','"+ currentUser.getGroupname()+"')\"  > <span class=\"outer\"><span class=\"inner "+menu[i].elemCSSClass+"\">"+menu[i].elemLabel+"</span></span></a></li>");
}
%> 
</ul>