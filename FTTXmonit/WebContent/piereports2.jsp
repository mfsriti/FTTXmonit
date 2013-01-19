<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ReportStatsBean "%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<script type="text/javascript" src="js/raphael/raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/g.raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/g.pie-min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="js/fttx/reports.js"></script> 
<%
List<ReportStatsBean> list = (List<ReportStatsBean>) session.getAttribute("listStats");

Gson gson = new Gson();
%>
</head>
<body onload="drawPie('report_canvas', '850px', '550px', <%
			out.print(gson.toJson(list).replace("\"", "&quot;"));	%>)">
	<div class="clear" style="height: 10px"></div>
	<div id="report_canvas" class="grid_15" style="-moz-border-radius: 15px;border-radius: 15px;"></div>
	
	
</body>
</html>
