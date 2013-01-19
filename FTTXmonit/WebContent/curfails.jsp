<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean "%>



<div class="grid_9">
	<h1 class="map">Failures</h1>
</div>
<div class="grid_15" id="textcontent">
	<div id="container">
		<iframe style="width: 900px; height: 600px; overflow: hidden;"
			src="keymap2.jsp"></iframe>
			
	</div>
</div>
<!-- CONTENT TITLE RIGHT BOX -->
<!--<div class="grid_6" id="eventbox">
	<a href="#" class="inline_tip">Click on "Display Failures" to see the map.</a>
</div>
<div class="clear"></div>
<div class="grid_15" id="textcontent"> 
<%
session.setAttribute("failMode", "true");
//Map<String,List<ComponentBean>> map = (Map<String,List<ComponentBean>>) session.getAttribute("mapComponents");
//Gson gson = new Gson();
%>
	<div id="container">
		<a href="javascript:void(0);" onclick="initMap('map_canvas', '550px');drawKeyMap(<%
		/*out.print(gson.toJson(map.get("FDT")).replace("\"", "&quot;"));	
		out.print(",");	
		out.print(gson.toJson(map.get("Hole")).replace("\"", "&quot;"));
		out.print(",");	
		out.print(gson.toJson(map.get("Cable")).replace("\"", "&quot;"));
		out.print(",");	
		out.print(gson.toJson(map.get("Splice")).replace("\"", "&quot;"));
		out.print(",");	
		out.print(gson.toJson(map.get("ODB")).replace("\"", "&quot;"));
		out.print(",");	
		out.print(gson.toJson(map.get("ONT")).replace("\"", "&quot;")); */
		%>,true);" class="button">
			<span>Display Failures</span>
		</a>
	</div>
	<div class="clear" style="height: 10px"></div>
	<input id="latlng" type="text" class="smallInput"/><br />
	<div id="map_canvas">
	</div>	
</div>
-->
