<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.beans.UserBean" %>




<% 

@SuppressWarnings("unchecked") 
List<UserBean> list = (List<UserBean>) session.getAttribute("listUsers");
UserBean addedUser = (UserBean) session.getAttribute("addedUser");
UserBean deletedUser = (UserBean) session.getAttribute("deletedUser");
UserBean updatedUser = (UserBean) session.getAttribute("updatedUser");
%>

<div class="grid_9" id="">
	<h1 class="users">Users</h1>
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
				alt="Latest Registered Users" /> List of users
		</div>
		<div class="portlet-content">
		<%
		if (addedUser!=null){
			if (addedUser.isValid()){
				out.print("<p class=\"info\" id=\"success\"><span class=\"info_inner\">");
				out.print("New user added: Username("+addedUser.getUsername()+"), "+"Password("+addedUser.getPassword()+")");
				out.print("</span></p>");
				
			} else {
				out.print("<p class=\"info\" id=\"error\"> <span class=\"info_inner\">");
				out.print("Cannot add user: Name("+addedUser.getFullname()+")");
				out.print("</span></p>");
			}
			session.setAttribute("addedUser",null);
		} 
		
		if(deletedUser!=null){
			if (deletedUser.isValid()) {
				out.print("<p class=\"info\" id=\"error\"> <span class=\"info_inner\">");
				out.print("Cannot add user: Name("+deletedUser.getUsername()+")");
				out.print("</span></p>");
			} else {
				out.print("<p class=\"info\" id=\"success\"><span class=\"info_inner\">");
				out.print("An existing user deleted: Username("+deletedUser.getUsername()+")");
				out.print("</span></p>");
				
			}
			session.setAttribute("deletedUser",null);
		}
		
		if(updatedUser!=null){
			if (addedUser.isValid()){
				out.print("<p class=\"info\" id=\"success\"><span class=\"info_inner\">");
				out.print("User updated: Username("+updatedUser.getUsername()+"), "+"Password("+updatedUser.getPassword()+")");
				out.print("</span></p>");
			} else {
				out.print("<p class=\"info\" id=\"error\"> <span class=\"info_inner\">");
				out.print("Cannot update user: Name("+updatedUser.getFullname()+")");
				out.print("</span></p>");
			}
			session.setAttribute("updatedUser",null);
		}
		%>
		<div>
		<a onclick="onClickButton('userform.jsp', '')" class="button"><span>Add new user</span></a>
		</div>
		<div class="clear" style="height: 10px">
		</div>
		<div>
			<form action="" method="post">
				<table width="100%" cellpadding="0" cellspacing="0"
					id="box-table-a">
					<thead>
						<tr>
							<th width="34" scope="col"><input type="checkbox"
								name="allbox" id="allbox" onclick="checkAll()" /></th>
							<th width="136" scope="col">Name</th>
							<th width="102" scope="col">Username</th>
							<th width="109" scope="col">Title</th>
							<th width="129" scope="col">Mobile</th>
							<th width="171" scope="col">Office</th>
							<th width="123" scope="col">Group</th>
							<th width="90" scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
					<%
					Iterator<UserBean> itr = list.iterator(); 
					while(itr.hasNext()) {
						UserBean element = (UserBean)itr.next(); 	
						
						out.print("<tr>");
						out.print("<td width=\"34\"><label> <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" /> </label></td>");
						out.print("<td>"+element.getFullname()+"</td>");
						out.print("<td>"+element.getUsername()+"</td>");
						out.print("<td>"+element.getTitle()+"</td>");		
						out.print("<td>"+element.getMobile()+"</td>");
						out.print("<td>"+element.getOffice()+"</td>");
						out.print("<td>"+element.getGroupname()+"</td>");
						out.print("<td width=\"90\">"); 
						 
						//out.print("<a href=\"javascript:void(0);\" onclick=\"onClickButton('userform.jsp','userId="+ element.getUsername()+"&')\" class=\"edit_icon\" title=\"Edit\"></a>");
						out.print("<a href=\"javascript:void(0);\" onclick=\"onClickButton('deleteUser','userId="+ element.getUsername()+"&')\" class=\"delete_icon\" title=\"Delete\"></a></td>");
						out.print("</tr>");
					}			
					 %>		
					</tbody>
				</table>
			</form>
		</div>
		<div align="right">
			<a onclick="onClickButton('userform.jsp', '')" class="button"><span>Add new user</span></a>
			<!-- <a class="edit_inline">Edit</a> -->
			<a class="delete_inline">Delete</a>
	    </div>
	</div>
	<!--  END #PORTLETS -->
</div>
</div>
<div class="clear"></div>
			<!-- END CONTENT-->
