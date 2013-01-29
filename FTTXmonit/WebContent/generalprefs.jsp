<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.beans.UserBean" %>






<div class="grid_9" id="">
	<h1 class="users">General Preferences</h1>
</div>
<!--RIGHT TEXT/CALENDAR-->
<div class="grid_6" id="eventbox">
	<a href="#" class="inline_calendar">You don't have any events for today!</a>
	<div class="hidden_calendar"></div>
</div>
<!--RIGHT TEXT/CALENDAR END-->
<div class="clear"></div>
<!--  TITLE END  -->
<!-- #PORTLETS START -->
<div id="portlets">
	<!--THIS IS A WIDE PORTLET-->
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
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Home Help" /> Home
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickMenu('one','<%=group %>');">Home preferences</a></li>
			 </ul>
		 </div>
	</div>
</div>

<%
if ( !group.equals("Administrator") ) {
%>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Keymap / SLD" /> KeyMap / SLD
	</div>
	<div class="portlet-content nopadding">
		 <div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('two','tab0','showKM');">KeyMap preferences</a></li>
<%
if ( !group.equals("DecisionMaker") ) {
%>
			 	<li><a href="javascript:onClickTab('two','tab1','showSLD');">SLD Schema preferences</a></li>
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
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Failures" /> Events / Failures
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('three','tab0','displayFails');">Display Failures preferences</a></li>
			 	<li><a href="javascript:onClickTab('three','tab1','listFails?type=Current');">Current Failures preferences</a></li>
			 	<li><a href="javascript:onClickTab('three','tab2','listFails?type=Resolved');">Resolved Failures preferences</a></li>	
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
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Reports" /> Reports
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('four','tab0','chartReport');">Chart Report preferences</a></li>
			 	<li><a href="javascript:onClickTab('four','tab1','pieReport');">Pie Report preferences</a></li>
			 	<li><a href="javascript:onClickTab('four','tab2','counterReport');">Failures Counters preferences</a></li>	
			 	<li><a href="javascript:onClickTab('four','tab3','spareReport');">Spare Capacities preferences</a></li>	
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
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Users" /> Manage Users
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('five','tab0','listUsers');">Users preferences</a></li>
			 	<li><a href="javascript:onClickTab('five','tab1','groups.jsp');">Groups preferences</a></li>
			 	<li><a href="javascript:onClickTab('five','tab2','actions.jsp');">Actions preferences</a></li>	
			 </ul>
		 </div>
	</div>
</div>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Backup" /> Backup
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('six','tab0','localbackup.jsp');">Local Backup preferences</a></li>
			 	<li><a href="javascript:onClickTab('six','tab1','serverbackup.jsp');">Server Backup preferences</a></li>
			  </ul>
		 </div>
	</div>
</div>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Configuration" /> Configuration help items
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickTab('seven','tab0','reportconfig.jsp');">Reports Configuration preferences</a></li>
			 	<li><a href="javascript:onClickTab('seven','tab1','aclconfig.jsp');">ACL Configuration preferences</a></li>
			 	<li><a href="javascript:onClickTab('seven','tab2','typeconfig.jsp');">Component Types Management preferences</a></li>	
			 </ul>
		 </div>	
	</div>
</div>
<%
}
%>
	<!--  END #PORTLETS -->
</div>

<div class="clear"></div>
			<!-- END CONTENT-->
