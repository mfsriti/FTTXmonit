<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ReportStatsBean "%>


<div class="grid_9">
	<h1 class="map">Reports</h1>
</div>
<!-- CONTENT TITLE RIGHT BOX -->
<div class="grid_6" id="eventbox">
	<a href="#" class="inline_tip">Click on "Display Report" to see the report.</a>
</div>
<div class="clear"></div>
<div class="grid_15" id="textcontent">
<%
List<ReportStatsBean> list = (List<ReportStatsBean>) session.getAttribute("listStats");

Gson gson = new Gson();
%>

	<div id="container">
		<a href="javascript:void(0);" onclick="drawPie('report_canvas', '895px', '550px', <%
			out.print(gson.toJson(list).replace("\"", "&quot;"));	%>)" class="button">
			<span>Display Report</span>
		</a>
	</div>
	<div class="clear" style="height: 10px"></div>
	<div id="report_canvas" class="grid_15" style="-moz-border-radius: 15px;border-radius: 15px;"></div>
	
</div>


