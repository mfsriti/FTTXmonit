<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.beans.UserBean" %>






<div class="grid_9" id="">
	<h1 class="users">Local backup</h1>
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
		<img src="images/icon_backup_small.png" width="16" height="16"
			alt="Home Help" /> Backup type
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickMenu('one','<%=group %>');">Backup in database import format.</a></li>
			 	<li><a href="javascript:onClickMenu('one','<%=group %>');">Backup in XML format.</a></li>
			 	<li><a href="javascript:onClickMenu('one','<%=group %>');">Backup in CSV format.</a></li>
			 </ul>
		 </div>
	</div>
</div>
<div class="portlet">
	<div class="portlet-header fixed">
		<img src="images/icon_prefs_small.png" width="16" height="16"
			alt="Home Help" /> Component/Element types
	</div>
	<div class="portlet-content nopadding">
		<div style="margin-top: 10px; margin-left: 20px;">
			 <ul class="news_items">
			 	<li><a href="javascript:onClickMenu('one','<%=group %>');">Select Component/Element types for backup</a></li>
			 </ul>
		 </div>
	</div>
</div>

	<!--  END #PORTLETS -->
</div>
<div class="clear"></div>
			<!-- END CONTENT-->
