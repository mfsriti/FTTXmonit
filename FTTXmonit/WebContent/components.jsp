<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.google.gson.Gson, java.util.Iterator, java.util.List, sa.edu.ksu.psatri.fttxmonit.beans.ComponentBean"%>

		<% 
			List<ComponentBean> list = (List<ComponentBean>) (session.getAttribute("listComponents"));
			if (list==null) 
				out.print("<option value=\"\"></option>");
			else {
				Iterator<ComponentBean> it = list.iterator();
			
				while (it.hasNext()){
					ComponentBean bean = (ComponentBean) it.next();
					out.print("<option value=" + bean.getComponentID()+">" + bean.getComponentID() + "</option>");
				}
			}
		    
		%>
