<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.google.gson.Gson, java.util.Map, java.util.List, sa.edu.ksu.psatri.fttxmonit.beans.ComponentTypeBean"%>

		<% 
			Gson gson = new Gson();
			List<ComponentTypeBean> list = (List<ComponentTypeBean>) (session.getAttribute("listTypes"));
		    out.print(gson.toJson(list));
		%>
