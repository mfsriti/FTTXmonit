<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.util.List, java.util.Iterator, sa.edu.ksu.psatri.fttxmonit.beans.RFailureBean, sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean" %>


<% @SuppressWarnings("unchecked") 
List<CFailureBean> currentFailures = (List<CFailureBean>) session.getAttribute("currentFailures");
@SuppressWarnings("unchecked") 
List<RFailureBean> resolvedfailures = (List<RFailureBean>) session.getAttribute("resolvedfailures");
String type = "Current";
int tabId = 1;
if (currentFailures==null) {
	type = "Resolved";
	tabId = 2;
}
%>
<div class="grid_9" id="">
	<h1 class="events"><%=type%> Failures</h1>
</div>

<div class="clear"></div>
<!-- #PORTLETS START -->
<div id="portlets">
	<!--THIS IS A WIDE PORTLET-->
	<div class="portlet">
		
		<a onclick="onClickTab('three', 'tab<%=tabId %>', 'listFails?type=<%=type%>')" class="button"><span>Refresh</span></a>
		</div>
		<div class="clear" style="height: 10px">
		</div>
		<div>
			<form action="" method="post">
				<table width="100%" cellpadding="0" cellspacing="0"
					id="box-table-a">
					<thead>
						<tr>
							<th width="34" scope="col"><input type="checkbox"
								name="allbox" id="allbox" onclick="checkAll()" /></th>
							<th width="122" scope="col">ID</th>
							<th width="122" scope="col">Date</th>
							<th width="122" scope="col">Type</th>
							<th width="122" scope="col">Component</th>
							<th width="122" scope="col"><%=(type.equals("Current") ? " ":"Resolver") %></th>
							<th width="122" scope="col"><%=(type.equals("Current") ? " ":"AutoRepair") %></th>
							<th width="122" scope="col"><%=(type.equals("Current") ? " ":"TechRepair") %></th>							
						</tr>
					</thead>
					<tbody>
					<%
					
					if (type.equals("Current") && currentFailures != null) {
						Iterator<CFailureBean> itr = currentFailures.iterator(); 
						while(itr.hasNext()) {
							CFailureBean element = (CFailureBean)itr.next(); 	
							
							out.print("<tr>");
							out.print("<td width=\"34\"><label> <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" /> </label></td>");
							out.print("<td>"+element.getFailureID()+"</td>");
							out.print("<td>"+element.getFailureDate().toLocaleString().substring(0,element.getFailureDate().toLocaleString().length()-9)+"</td>");
							out.print("<td>"+element.getFailureType()+"</td>");		
							out.print("<td>"+element.getComponentID()+"</td>");						
							out.print("<td width=\"90\" colspan=\"3\" align=\"center\">"); 
							//String onclickStr = " onclick=\"onClickTab('three', 'tab"+tabId+"', 'listFails?type="+type+"&failureId="+element.getFailureID()+"') ";
							//out.print("<a class=\"button_ok\""+onclickStr+"><span>Repair \""+element.getFailureID()+"\"</span></a></td>");
						    %>
						    <a class="button_ok" onclick="onClickTab('three', 'tab<%=tabId %>', 'repairFail?id=<%=element.getFailureID()%>')"><span>Repair "<%=element.getFailureID()%>"</span></a>
						    <%
							out.print("</td></tr>");
						}	
					} else if (type.equals("Resolved") && resolvedfailures != null) {
						Iterator<RFailureBean> itr = resolvedfailures.iterator(); 
						while(itr.hasNext()) {
							RFailureBean element = (RFailureBean)itr.next(); 	
							out.print("<tr>");
							out.print("<td width=\"34\"><label> <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" /> </label></td>");
							out.print("<td>"+element.getFailureID()+"</td>");
							out.print("<td>"+element.getFailureDate().toLocaleString().substring(0,element.getFailureDate().toLocaleString().length()-9)+"</td>");
							out.print("<td>"+element.getFailureType()+"</td>");		
							out.print("<td>"+element.getComponentID()+"</td>");						
							out.print("<td>"+element.getResolverID()+"</td>");						
							out.print("<td>"+(element.getAutoRepairDate()==null? "-": element.getAutoRepairDate().toLocaleString().substring(0,element.getFailureDate().toLocaleString().length()-9))+"</td>");						
							out.print("<td>"+(element.getTechRepairDate()==null? "-":element.getTechRepairDate().toLocaleString().substring(0,element.getFailureDate().toLocaleString().length()-9))+"</td>");						
							out.print("</tr>");
						}	
					}
					 %>		
					</tbody>
				</table>
			</form>
		</div>
		<div align="right">
			<a onclick="onClickTab('three', 'tab<%=tabId %>', 'listFails?type=<%=type%>')" class="button"><span>Refresh</span></a>
	    </div>
	</div>
	<!--  END #PORTLETS -->

<div class="clear"></div>
			<!-- END CONTENT-->
