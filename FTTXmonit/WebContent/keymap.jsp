<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean "%>



<div class="grid_9">
	<h1 class="map">Key Map</h1>
</div>
<!-- CONTENT TITLE RIGHT BOX -->
<div class="grid_6" id="eventbox">
	<a href="#" class="inline_tip">Click on "Display Key Map" to see the map.</a>
</div>
<div class="clear"></div>
<div class="grid_15" id="textcontent">
<%
Map<String,List<ComponentBean>> map = (Map<String,List<ComponentBean>>) session.getAttribute("mapComponents");
Gson gson = new Gson();
%>
	<div id="container">
		<a href="javascript:void(0);" onclick="initMap('map_canvas', '550px');drawKeyMap(<%
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
		%>);" class="button">
			<span>Display Key Map</span>
		</a>
	</div>
	<div class="clear" style="height: 10px"></div>
	<input id="latlng" type="text" class="smallInput"/><br />
	<div id="map_canvas">
	</div>	
</div>
