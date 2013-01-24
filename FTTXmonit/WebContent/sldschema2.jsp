<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.google.gson.Gson, java.util.Map, java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils,sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean "%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/fttx.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/raphael/raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/g.raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/raphaeljs-infobox.js"></script>
<script type="text/javascript" src="js/fttx/sld.js"></script> 
<%
Map<String,List<ComponentBean>> map = (Map<String,List<ComponentBean>>) session.getAttribute("mapComponents");
Gson gson = new Gson();
%>
</head>
<body onload="initSLD('sld_canvas', '895px', '550px');drawSLD(<%
				out.print(gson.toJson(map.get("FDT")).replace("\"", "&quot;"));	
				out.print(",");	
				out.print(gson.toJson(map.get("Hole")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("Cable")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("ODB")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("ONT")).replace("\"", "&quot;"));
				out.print(",");	
				out.print(gson.toJson(map.get("Splitter")).replace("\"", "&quot;"));
				%>);" >

	<div id="sld_canvas" style="-moz-border-radius: 15px;border-radius: 15px;"></div>
</body>
</html>