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
<!--[if IE]>
    <script language="javascript" type="text/javascript" src="js/flot/excanvas.pack.js"></script>
    <![endif]-->
<!--[if IE 6]>
	<link rel="stylesheet" type="text/css" href="css/iefix.css" />
	<script src="js/pngfix.js"></script>
    <script>
        DD_belatedPNG.fix('#menu ul li a span span');
    </script>        
    <![endif]-->
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
			<script>onClickMenu('one');</script>
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
			<!--<div id="map" style="width:100%; height:380pt"/>-->
			<!--  TITLE START  -->
			<div class="grid_9" id="">
				<h1 class="dashboard">Home</h1>
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
				<!-- FIRST SORTABLE COLUMN START -->
				<div class="column" id="left">
				<div class="portlet">
		<div class="portlet-header fixed">
			<img src="images/icons/user.gif" width="16" height="16"
				alt="Latest Registered Users" /> Map
		</div>
		<div class="portlet-content">
			<a href="javascript:void(0);" onclick="initMap2('map_canvas', '380pt')">Click</a>
			<div id="map_canvas" style="width: 100%; height: 380pt"></div>
		</div>
	</div>
					<!--THIS IS A PORTLET-->
					<div class="portlet">
						<div class="portlet-header">
							<img src="images/icons/chart_bar.gif" width="16" height="16" alt="Reports" /> Map
						</div>
						<div class="portlet-content">
							<div id="map" style="width: auto; height: 250px;"></div>
						</div>
					</div>
					<!--THIS IS A PORTLET-->
					<div class="portlet">
						<div class="portlet-header">
							<img src="images/icons/chart_bar.gif" width="16" height="16" alt="Reports" /> Failures - Last 30 days
						</div>
						<div class="portlet-content">
							<!--THIS IS A PLACEHOLDER FOR FLOT - Report & Graphs -->
							<div id="placeholder" style="width: auto; height: 250px;"></div>
						</div>
					</div>
					<!--THIS IS A PORTLET-->
					<div class="portlet">
						<div class="portlet-header">Anything (no icon too if you
							like it better)</div>

						<div class="portlet-content">
							<p>This can be any content you want. I placed a basic form
								here with text editor so you can see the functionality of the
								forms too.</p>
							<h3>This is a form</h3>
							<form id="form1" name="form1" method="post" action="">
								<label>Some title</label> <input type="text" name="textfield"
									id="textfield" class="smallInput" /> <label>Large
									input box</label> <input type="text" name="textfield2" id="textfield2"
									class="largeInput" /> <label>This is a textarea</label>
								<textarea name="textarea" cols="45" rows="3" class="smallInput"
									id="textarea"></textarea>
								<a class="button"><span>Submit in blue</span></a> <a
									class="button_grey"><span>Submit this form</span></a>
							</form>
							<p>&nbsp;</p>
						</div>
					</div>
				</div>
				<!-- FIRST SORTABLE COLUMN END -->
				<!-- SECOND SORTABLE COLUMN START -->
				<div class="column">
					<!--THIS IS A PORTLET-->
					<div class="portlet">
						<div class="portlet-header">
							<img src="images/icons/comments.gif" width="16" height="16"
								alt="Comments" />Latest Failures
						</div>

						<div class="portlet-content">
							<p class="info" id="success">
								<span class="info_inner">Lorem ipsum dolor sit amet,
									consectetuer adipiscing elit</span>
							</p>
							<p class="info" id="error">
								<span class="info_inner">Lorem ipsum dolor sit amet,
									consectetuer adipiscing elit</span>
							</p>
							<p class="info" id="warning">
								<span class="info_inner">Lorem ipsum dolor sit amet,
									consectetuer adipiscing elit</span>
							</p>
							<p class="info" id="info">
								<span class="info_inner">Lorem ipsum dolor sit amet,
									consectetuer adipiscing elit</span>
							</p>
							Lorem ipsum dolor sit amet, consectetuer adipiscing elit
						</div>
					</div>
					<!--THIS IS A PORTLET-->
					<div class="portlet">
						<div class="portlet-header">
							<img src="images/icons/feed.gif" width="16" height="16"
								alt="Feeds" />Your selected News source
						</div>
						<div class="portlet-content">
							<ul class="news_items">
								<li>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Aenean adipiscing massa quis arcu interdum scelerisque.
									Duis vitae nunc nisi. Quisque eget leo a nibh gravida vulputate
									ut sed nulla. <a href="#">Donec quis lectus turpis, sed
										mollis nibh</a>. Donec ut mi eu metus ultrices porttitor.
									Phasellus nec elit in nisi
								</li>
								<li>Nunc convallis, enim quis tincidunt dictum, ante ipsum
									interdum massa, consequat sodales arcu magna nec eros.<a
									href="#"> Vivamus nec placerat odio.</a> Sed nec mi sed orci
									mattis feugiat. Etiam est dui, rutrum nec dictum vel, accumsan
									id sem.
								</li>
								<li>Nunc convallis, enim quis tincidunt dictum, ante ipsum
									interdum massa, consequat sodales arcu magna nec eros.<a
									href="#"> Vivamus nec placerat odio.</a> Sed nec mi sed orci
									mattis feugiat. Etiam est dui, rutrum nec dictum vel, accumsan
									id sem.
								</li>
								<li>Nunc convallis, enim quis tincidunt dictum, ante ipsum
									interdum massa, consequat sodales arcu magna nec eros.<a
									href="#"> Vivamus nec placerat odio.</a> Sed nec mi sed orci
									mattis feugiat. Etiam est dui, rutrum nec dictum vel, accumsan
									id sem.
								</li>
								<li>Nunc convallis, enim quis tincidunt dictum, ante ipsum
									interdum massa, consequat sodales arcu magna nec eros.<a
									href="#"> Vivamus nec placerat odio.</a> Sed nec mi sed orci
									mattis feugiat.
								</li>
							</ul>
							<a href="#">&raquo; View all news items</a>
						</div>
					</div>
				</div>
				<!--  SECOND SORTABLE COLUMN END -->
				<div class="clear"></div>
				<!--THIS IS A WIDE PORTLET-->
				<div class="portlet">
					<div class="portlet-header fixed">
						<img src="images/icons/user.gif" width="16" height="16"
							alt="Latest Registered Users" /> Last Registered users Table
						Example
					</div>
					<div class="portlet-content nopadding">
						<form action="" method="post">
							<table width="100%" cellpadding="0" cellspacing="0"
								id="box-table-a" summary="Employee Pay Sheet">
								<thead>
									<tr>
										<th width="34" scope="col"><input type="checkbox"
											name="allbox" id="allbox" onclick="checkAll()" /></th>
										<th width="136" scope="col">Name</th>
										<th width="102" scope="col">Username</th>
										<th width="109" scope="col">Date</th>
										<th width="129" scope="col">Location</th>
										<th width="171" scope="col">E-mail</th>
										<th width="123" scope="col">Phone</th>
										<th width="90" scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td width="34"><label> <input type="checkbox"
												name="checkbox" id="checkbox" />
										</label></td>
										<td>Stephen C. Cox</td>
										<td>stephen</td>
										<td>20.06.2009</td>
										<td>Los Angeles, CA</td>
										<td>address1@yahoo.com</td>
										<td>332-5447879</td>
										<td width="90"><a href="#" class="approve_icon"
											title="Approve"></a> <a href="#" class="reject_icon"
											title="Reject"></a> <a href="#" class="edit_icon"
											title="Edit"></a> <a href="#" class="delete_icon"
											title="Delete"></a></td>
									</tr>
									<tr>
										<td width="34"><input type="checkbox" name="checkbox2"
											id="checkbox2" /></td>
										<td>Josephin Tan</td>
										<td>josephin</td>
										<td>20.06.2009</td>
										<td>Los Angeles, CA</td>
										<td>address1@yahoo.com</td>
										<td>332-5447879</td>
										<td width="90"><a href="#" class="approve_icon"
											title="Approve"></a> <a href="#" class="reject_icon"
											title="Reject"></a> <a href="edit_modal.html"
											class="edit_icon" title="Edit"></a> <a href="#"
											class="delete_icon" title="Delete"></a></td>
									</tr>
									<tr>
										<td width="34"><input type="checkbox" name="checkbox3"
											id="checkbox3" /></td>
										<td>Joyce Ming</td>
										<td>joyce_m</td>
										<td>20.06.2009</td>
										<td>Los Angeles, CA</td>
										<td>address1@yahoo.com</td>
										<td>332-5447879</td>
										<td width="90"><a href="#" class="approve_icon"
											title="Approve"></a> <a href="#" class="reject_icon"
											title="Reject"></a> <a href="#" class="edit_icon"
											title="Edit"></a> <a href="#" class="delete_icon"
											title="Delete"></a></td>
									</tr>
									<tr>
										<td width="34"><input type="checkbox" name="checkbox4"
											id="checkbox4" /></td>
										<td>James A. Pentel</td>
										<td>james_pent</td>
										<td>20.06.2009</td>
										<td>Los Angeles, CA</td>
										<td>address1@yahoo.com</td>
										<td>332-5447879</td>
										<td width="90"><a href="#" class="approve_icon"
											title="Approve"></a> <a href="#" class="reject_icon"
											title="Reject"></a> <a href="#" class="edit_icon"
											title="Edit"></a> <a href="#" class="delete_icon"
											title="Delete"></a></td>
									</tr>
									<tr class="footer">
										<td colspan="4"><a href="#" class="edit_inline">Edit
												all</a><a href="#" class="delete_inline">Delete all</a><a
											href="#" class="approve_inline">Approve all</a><a href="#"
											class="reject_inline">Reject all</a></td>
										<td align="right">&nbsp;</td>
										<td colspan="3" align="right">
											<!--  PAGINATION START  -->
											<div class="pagination">
												<span class="previous-off">&laquo; Previous</span> <span
													class="active">1</span> <a href="query_41878854">2</a> <a
													href="query_8A8058C2">3</a> <a href="query_2823E521">4</a>
												<a href="query_B322F5B7">5</a> <a href="query_3A2A444D">6</a>
												<a href="query_912D14DB">7</a> <a href="query_41878854"
													class="next">Next &raquo;</a>
											</div> <!--  PAGINATION END  -->
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<!--  END #PORTLETS -->
			</div>
			<div class="clear"></div>
			<!-- END CONTENT-->
		</div>
		<div class="clear"></div>
	</div>
	<!-- WRAPPER END -->
	<!-- FOOTER START -->
	<div class="container_16" id="footer">
		Administrated by <a href="http://ksu.edu.sa/Research/ATRC/">PSATRI</a>
	</div>
	<!-- FOOTER END -->
</body>
</html>
