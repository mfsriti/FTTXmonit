<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List,java.util.Iterator,sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ReportStatsBean"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="css/chart.css" type="text/css"
	media="screen">
<script type="text/javascript" src="js/raphael/raphael-min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/raphael/popup.js"></script>
<script type="text/javascript" src="js/raphael/analytics.js"></script>
<style type="text/css" media="screen">
#holder {
	height: 250px;
	margin: -125px 0 0 -400px;
	width: 800px;
}
<%
		List<ReportStatsBean> list = (List<ReportStatsBean>) session
				.getAttribute("listStats");

String ths = "", tds ="";
Iterator<ReportStatsBean> it = list.iterator();
while(it.hasNext()){
	ReportStatsBean b = it.next();
	ths +="<th>"+b.getStatMounth()+"</th>";
	tds +="<td>"+b.getStatNumber()+"</td>";
}
		
	%>
</style>
</head>
<body>
	<table id="data">
		<tfoot>
			<tr>
				<% out.print(ths);%>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<% out.print(tds);%>
			</tr>
		</tbody>
	</table>
	<div id="holder"></div>
</body>
</html>
<html>