<%@page import="sa.edu.ksu.psatri.fttxmonit.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	UserBean currentUser = (UserBean) (session
			.getAttribute("currentSessionUser"));
	if (currentUser == null) {
		response.sendRedirect("index.jsp");
	}
	String group = currentUser.getGroupname();
%>



<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Home Help" /> Home help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('one','tab0','homecontent.jsp');">Home view</a></li>
			 </ul>
		 </div>
	</div>
</div>

<%
if ( !group.equals("Administrator") ) {
%>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Keymap / SLD" /> KeyMap / SLD help items
	</div>
	<div class="portlet-content nopadding">
		 <div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('two','tab0','showKM');">KeyMap view</a></li>
<%
if ( !group.equals("DecisionMaker") ) {
%>
			 	<li><a href="javascript:onClickTab('two','tab1','showSLD');">SLD Schema view</a></li>
<%
}
%>
			 </ul>
		 </div>
	</div>
</div>
<%
}

if( group.equals("Engineer") || group.equals("Technician") ) {
%>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Failures" /> Events / Failures help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('three','tab0','displayFails');">Display Failures view</a></li>
			 	<li><a href="javascript:onClickTab('three','tab1','listFails?type=Current');">Current Failures table</a></li>
			 	<li><a href="javascript:onClickTab('three','tab2','listFails?type=Resolved');">Resolved Failures table</a></li>	
			 </ul>
		 </div>
	</div>
</div>
<%
}

if( group.equals("Engineer") || group.equals("DecisionMaker") ) {
%>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Reports" /> Reports help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('four','tab0','chartReport');">Chart Report view</a></li>
			 	<li><a href="javascript:onClickTab('four','tab1','pieReport');">Pie Report view</a></li>
			 	<li><a href="javascript:onClickTab('four','tab2','counterReport');">Failures Counters view</a></li>	
			 	<li><a href="javascript:onClickTab('four','tab3','spareReport');">Spare Capacities view</a></li>	
			 </ul>
		 </div>
	</div>
</div>
<%
}

if( group.equals("Administrator") ) {
%>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Users" /> Manage Users help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('five','tab0','listUsers');">Users view</a>: list, add, or delete users.</li>
			 	<li><a href="javascript:onClickTab('five','tab1','listGroups');">Groups view</a>: display existing groups of users.</li>
			 	<li><a href="javascript:onClickTab('five','tab2','listActions');">Actions view</a>: display assigning actions to each group.</li>	
			 </ul>
		 </div>
	</div>
</div>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Backup" /> Backup help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('six','tab0','localbackup.jsp');">Local Backup view</a>: download a backup from the server.</li>
			 	<li><a href="javascript:onClickTab('six','tab1','serverbackup.jsp');">Server Backup view</a>: launch a backup on the server.</li>
			  </ul>
		 </div>
	</div>
</div>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Configuration" /> Configuration help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('seven','tab0','reportconfig.jsp');">Reports Configuration view</a></li>
			 	<li><a href="javascript:onClickTab('seven','tab1','aclconfig.jsp');">ACL Configuration view</a></li>
			 	<li><a href="javascript:onClickTab('seven','tab2','typeconfig.jsp');">Component Types Management view</a></li>	
			 </ul>
		 </div>	
	</div>
</div>
<%
}
%>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_help_small.png" width="16" height="16"
			alt="Preferences" />Preferences help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('eight','tab0','generalprefs.jsp');">General Preferences view</a>: application properties.</li>
			 	<li><a href="javascript:onClickTab('eight','tab1','displayprefs.jsp');">Display Preferences view</a>: interface properties.</li>
			  </ul>
		 </div>	
	</div>
</div>