<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String type = request.getParameter("type");
%>
<div class="grid_9">
	<h1 class="map">Failures Counters Report</h1>
</div>
<div class="grid_15" id="textcontent">
	<div id="container">
		<iframe style="width: 900px; height: 600px; overflow: hidden;"
			src="countersparereport2.jsp?type=<%=type%>"></iframe>
	</div>
</div>
