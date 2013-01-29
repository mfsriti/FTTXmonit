<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.beans.GroupBean,sa.edu.ksu.psatri.fttxmonit.daos.GroupDAO, sa.edu.ksu.psatri.fttxmonit.beans.UserBean,sa.edu.ksu.psatri.fttxmonit.daos.UserDAO" %>

<%
String userId = (String) request.getParameter("userId");
UserBean user = null;
String name = null;
String title = null;
String mobile = null;
String office = null;
String password = null;
int groupId;
if (userId!=null){
	user = UserDAO.findUser(userId);
	name = (user.getFullname() != null ? user.getFullname() : "");
	title = (user.getTitle()!= null ? user.getTitle() : "");
	mobile = (user.getMobile() != null ? user.getMobile() : "");
	office = (user.getOffice() != null ? user.getOffice() :  "");
	groupId = user.getGroupid();
	password = (user.getPassword() != null ? user.getPassword(): "");
}
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

	<div class="portlet">
		<div class="portlet-header"><%=(userId==null?"Add new user":"Update an existing user")%></div>
	
		<div class="portlet-content">
			<p></p>
			<h3>Please update the following form.</h3>
			<%if (user==null) { %>
			<form id="adduserform" name="adduserform" action="addUser" method="GET">
			<%} else { %>
			<form id="updateuserform" name="updateuserform" action="updateUser" method="GET">
				<label>Username</label> <input type="text" name="username" id="username" class="smallInput" value="<%=userId%>" readonly/>
			<%} %>
				<label>Name</label> <input type="text" name="name" id="name" class="smallInput" value="<%=name%>"/>
			    <label>Password</label> <input type="text" name="password" id="password" class="smallInput"  value="<%=password%>"/>
			    <label>Title</label> <input type="text" name="title" id="title" class="smallInput" value="<%=title%>"/>
			    <label>Mobile</label> <input type="text" name="mobile" id="mobile" class="smallInput" value="<%=mobile%>"/>
			    <label>Office</label> <input type="text" name="office" id="office" class="smallInput" value="<%=office%>"/>
			    <label>Group</label> 
			    <select name="group" id="group" class="smallInput">
			        <% List<GroupBean> list = GroupDAO.listGroups();
			        Iterator<GroupBean> itr = list.iterator(); 
					while(itr.hasNext()) {
						GroupBean group = ((GroupBean)itr.next());
						out.print("<option value=\""+ group.getGroupID() + "\" " + (user.getGroupid()==group.getGroupID()? " selected ":"") + ">" + group.getGroupName() + "</option>"); 
					}
			        %>         
        		</select>
        		
			    <label>&nbsp;</label>	
			    <%if (user==null) { %>
			    <a class="button" onclick="postForm('adduserform')"><span>Submit</span></a>		
			    <%} else { %>
			 	<a class="button" onclick="postForm('updateuserform')"><span>Submit</span></a>
			 	<%} %>
			</form>
			<p>&nbsp;</p>
		</div>
	</div>
</div>