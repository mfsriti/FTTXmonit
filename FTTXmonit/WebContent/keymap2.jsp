<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean "%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCwS3h4eGQt9VcoyduaW6kd7_KmJ0SaDe0&amp;sensor=false"></script>
<script type="text/javascript" src="js/fttx/infobox.js"></script> 
<script type="text/javascript" src="js/fttx/map.js"></script> 
<%
String failMode =(String)session.getAttribute("failMode");
if (failMode=="true"){
	%>
<script type="text/javascript">
	var timer;
	var seconds = 10; 

	function startActivityRefresh() {
	    timer = setInterval(function() {
	        $('#map_canvas').load('displayFails');
	    }, seconds*1000)
	}

	function cancelActivityRefresh() {
	    clearInterval(timer);
	}
	$(function() {
	    startActivityRefresh();
	});
</script>
	<%
}
	
%>
</head>
<%

Map<String,List<ComponentBean>> map = (Map<String,List<ComponentBean>>) session.getAttribute("mapComponents");
Gson gson = new Gson();
		if(map!=null && !map.isEmpty()){
		    out.print("<body onload = \"initMap('map_canvas', '550px');drawKeyMap(");
		
			out.print(gson.toJson(map.get("FDT")).replace("\"", "&quot;"));	
			out.print(",");	
			out.print(gson.toJson(map.get("Hole")).replace("\"", "&quot;"));
			out.print(",");	
			out.print(gson.toJson(map.get("Cable")).replace("\"", "&quot;"));
			out.print(",");	
			out.print(gson.toJson(map.get("Splice")).replace("\"", "&quot;"));
			out.print(",");	
			out.print(gson.toJson(map.get("ODB")).replace("\"", "&quot;"));
			out.print(",");	
			out.print(gson.toJson(map.get("ONT")).replace("\"", "&quot;"));
			out.print(",");
			out.print(failMode);
			out.print(");\" >");
		} else {
			 out.print("<body onload = \"initMap('map_canvas', '550px');\">");
		} %>
	<div id="map_canvas">
	</div>
</body>
</html>