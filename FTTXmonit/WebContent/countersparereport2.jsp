<%@page import="sa.edu.ksu.psatri.fttxmonit.beans.ReportStats2Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean "%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/fttx.css" />
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCwS3h4eGQt9VcoyduaW6kd7_KmJ0SaDe0&amp;sensor=false"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/fttx/infobox.js"></script> 
<script type="text/javascript" src="js/fttx/map.js"></script> 

</head>
<%
String type = request.getParameter("type");

Map<String,ReportStats2Bean> map1 = (Map<String,ReportStats2Bean>) session.getAttribute("mapStats");
Map<String,List<ComponentBean>> map2 = (Map<String,List<ComponentBean>>) session.getAttribute("mapComponents");
Gson gson = new Gson();
		if(map1!=null && !map1.isEmpty()){
		    out.print("<body onload = \"initMap('map_canvas', '550px');drawFailureCounters(");
		
			out.print(gson.toJson(map2.get("FDT")).replace("\"", "&quot;"));	
			out.print(", ");	
			out.print(gson.toJson(map2.get("Hole")).replace("\"", "&quot;"));
			out.print(", ");	
			out.print(gson.toJson(map2.get("Cable")).replace("\"", "&quot;"));
			out.print(", ");	
			out.print(gson.toJson(map2.get("Splice")).replace("\"", "&quot;"));
			out.print(", ");	
			out.print(gson.toJson(map2.get("ODB")).replace("\"", "&quot;"));
			out.print(", ");	
			out.print(gson.toJson(map2.get("ONT")).replace("\"", "&quot;"));
			out.print(", ");
			out.print(gson.toJson(map1).replace("\"", "&quot;"));
			out.print(", '");
			out.print(type);
			out.print("');\" >");
		} else {
			 out.print("<body onload = \"initMap('map_canvas', '550px');\">");
		} %>
		
	<div id="map_canvas">
	</div>
</body>
</html>