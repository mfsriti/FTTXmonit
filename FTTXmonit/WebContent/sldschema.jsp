<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean "%>

<div class="grid_9">
	<h1 class="map">SLD Schema</h1>
</div>
<!-- CONTENT TITLE RIGHT BOX -->
<div class="grid_6" id="eventbox">
	<a href="#" class="inline_tip">Click on "Display SLD" to see the SLD Schema.</a>
</div>
<div class="clear"></div>
<div class="grid_15" id="textcontent">
<%
Map<String,List<ComponentBean>> map = (Map<String,List<ComponentBean>>) session.getAttribute("mapComponents");
Gson gson = new Gson();
%>
	<div id="container">
		<a href="javascript:void(0);" onclick="initSLD('sld_canvas', '895px', '550px');drawSLD(<%
				out.print(gson.toJson(map.get("FDT")).replace("\"", "&quot;"));	
				out.print(",");	
				out.print(gson.toJson(map.get("Hole")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("Cable")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("ODB")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("ONT")).replace("\"", "&quot;"));
				%>);" class="button">
			<span>Display SLD</span>
		</a>
	</div>
	<div align="center" class="clear" style="height: 10px"></div>

	<div id="sld_canvas" style="-moz-border-radius: 15px;border-radius: 15px;"></div>
	
</div>
