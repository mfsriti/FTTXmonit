<%@page import="sa.edu.ksu.psatri.fttxmonit.beans.GroupBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.beans.UserBean" %>


<% 

@SuppressWarnings("unchecked") 
List<GroupBean> list = (List<GroupBean>) session.getAttribute("listGroups");

%>

<div class="grid_9" id="">
	<h1 class="users">Groups</h1>
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
	<div class="portlet">
		<div class="portlet-header fixed">
			<img src="images/icons/user.gif" width="16" height="16"
				alt="Latest Registered Users" /> List of groups
		</div>
		<div class="portlet-content">
		
		<div class="clear" style="height: 10px">
		</div>
		<div>
			<form action="" method="post">
				<table  cellpadding="0" cellspacing="0"
					id="box-table-a">
					<thead>
						<tr>
							<th width="34" scope="col"><input type="checkbox"
								name="allbox" id="allbox" onclick="checkAll()" /></th>
							<th width="75" scope="col">Id</th>
							<th width="150" scope="col">Name</th>
						</tr>
					</thead>
					<tbody>
					<%
					Iterator<GroupBean> itr = list.iterator(); 
					while(itr.hasNext()) {
						GroupBean element = (GroupBean)itr.next(); 	
						
						out.print("<tr>");
						out.print("<td width=\"34\"><label> <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" /> </label></td>");
						out.print("<td>"+element.getGroupID()+"</td>");
						out.print("<td>"+element.getGroupName()+"</td>");
						out.print("</tr>");
					}			
					 %>		
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!--  END #PORTLETS -->
</div>
</div>
<div class="clear"></div>
			<!-- END CONTENT-->
