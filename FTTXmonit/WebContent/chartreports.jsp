<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.google.gson.Gson,java.util.Map,java.util.List,java.util.Iterator,sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ReportStatsBean"%>


<div class="grid_9">
	<h1 class="map">Reports</h1>
</div>
<!-- CONTENT TITLE RIGHT BOX -->
<div class="grid_6" id="eventbox">
	<a href="#" class="inline_tip">Click on "Update Chart" to actualize
		displayed data.</a>
</div>
<div class="clear"></div>
<div class="grid_15" id="textcontent">
	<%
		List<ReportStatsBean> list = (List<ReportStatsBean>) session
				.getAttribute("listStats");

		Gson gson = new Gson();
	%>

	<div id="container">
		<iframe style="width: 900px; height: 330px; overflow: hidden;"
			src="chartreports2.jsp"></iframe>
	</div>
	<div id="container">
		<a href="javascript:void(0);"
			onclick="drawChart('report_canvas', '895px', '550px')" class="button">
			<span>Update Chart</span>
		</a>
	</div>
</div>
<%
	String ths = "", tds ="";
	Iterator<ReportStatsBean> it = list.iterator();
	while(it.hasNext()){
		ReportStatsBean b = it.next();
		ths +="<th>"+b.getStatMounth()+"</th>";
		tds +="<td>"+b.getStatNumber()+"</td>";
	}
%>

