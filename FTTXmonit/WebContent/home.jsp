<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="sa.edu.ksu.psatri.fttxmonit.beans.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%
	UserBean currentUser = (UserBean) (session
			.getAttribute("currentSessionUser"));
	if (currentUser == null) {
		response.sendRedirect("index.jsp");
	}
	String group = currentUser.getGroupname();
	String themeColor = "red";
	if (group.equals("Engineer"))
		themeColor = "blue";
	else if (group.equals("Technician"))
		themeColor = "green";
%>
<title>FTTX Monitoring | User Logged Successfully as <%=group%>
</title>
<link rel="stylesheet" href="css/chart.css" type="text/css"
	media="screen"/>
	
<link rel="stylesheet" type="text/css" href="css/960.css" />
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/text.css" />
<link rel="stylesheet" type="text/css" href="css/<%=themeColor%>.css" />
<link type="text/css" href="css/smoothness/ui.css" rel="stylesheet" />
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCwS3h4eGQt9VcoyduaW6kd7_KmJ0SaDe0&amp;sensor=false"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/form/jquery.form.js"></script> 
<script type="text/javascript" src="js/blend/jquery.blend.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.sortable.js"></script>
<script type="text/javascript" src="js/ui.dialog.js"></script>
<script type="text/javascript" src="js/ui.datepicker.js"></script>
<script type="text/javascript" src="js/effects.js"></script>
<script type="text/javascript" src="js/flot/jquery.flot.pack.js"></script>

<script type="text/javascript" src="js/graphs.js"></script>
<script type="text/javascript" src="js/raphael/raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/g.raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/g.pie-min.js"></script>
<script type="text/javascript" src="js/raphael/popup.js"></script>
<script type="text/javascript" src="js/raphael/analytics.js"></script>
<script type="text/javascript" src="js/fttx/actions.js"></script>
<script type="text/javascript" src="js/fttx/infobox.js"></script> 
<script type="text/javascript" src="js/fttx/map.js"></script> 
<script type="text/javascript" src="js/fttx/sld.js"></script> 
<script type="text/javascript" src="js/fttx/reports.js"></script> 

        
</head>
<body>
	<!-- WRAPPER START -->
	<div class="container_16" id="wrapper">
		<!--LOGO-->
		<div class="grid_8" id="logo">FTTX Monitoring</div>
		<!-- USER TOOLS START -->
		<div class="grid_8">	
			<div id="user_tools">
				<span><a href="#" class="mail">(3)</a> Welcome <a href="#"><%=currentUser.getFullname()%></a>
					| <a class="dropdown" href="#">Options</a> | <a href="logout">Logout</a></span>
			</div>
		</div>
		<!-- USER TOOLS END -->
		<div class="grid_16" id="header">
			<!-- MENU START -->
			<div id="menu">
			</div>
			<script>onClickMenu('one','<%=group%>');</script>
			<!-- MENU END -->
		</div>
		<div class="grid_16">
			<!-- TABS START -->
			<div id="tabs">
			</div>
			<!-- TABS END -->
		</div>
		<!-- CONTENT START -->
		<div class="grid_16" id="content">
						
		</div>
		<div class="clear"></div>
		<!-- END CONTENT-->
	</div>
	<!-- WRAPPER END -->
	<!-- FOOTER START -->
	<div class="container_16" id="footer">
		Administrated by <a href="http://ksu.edu.sa/Research/ATRC/">PSATRI</a>
	</div>
	<!-- FOOTER END -->
</body>
</html>
