<%@page import="sa.edu.ksu.psatri.fttxmonit.beans.CFailureBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FTTX Monitoring | Test</title>
<link href="css/960.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/text.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/login.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/fttx/actions.js"></script>

<script type="text/javascript">
$(function(){
	  var items="<option value=''>Select component type</option>";
	  $.getJSON("loadTypes",function(data){

	    $.each(data,function(index,item) 
	    {
	      items+="<option value='"+item.componentTypeID+"'>"+item.componentTypeName+"</option>";
	    });
	    $("#componenttype").html(items); 
	  });
	});
</script>

</head>

<body>
	<div class="container_16">
		<div class="grid_6 prefix_5 suffix_5">
			<h1>Interface for generating failures in FTTX Monitoring Application</h1>
			<div id="login">
				<p class="tip"><%
				CFailureBean bean = (CFailureBean) session.getAttribute("addedFailure");
				if (bean!=null && bean.isValid())
					out.print("Failure with ID <" + bean.getFailureID() + "> on component <"+bean.getComponentID()+">");
				else
					out.print("Please select a type and then a specific component.");
				%></p>
				<form action="genFails">
					<p>
						<label>
							<strong>Component Type</strong> <br/>
							<select name="componenttype" id="componenttype" class="smallInput" onchange="changeElement('componentid', 'loadComponents', 'ComponentTypeId='+this.options[this.selectedIndex].value);">
							</select>
						</label>
					</p>
					<p>
						<label>
							<strong>Component ID</strong> <br/>
							<select name="componentid" id="componentid" class="smallInput">
							</select>
						</label>
					</p>

					<a class="black_button"
						onclick="document.forms[0].submit()"><span>Generate failure</span></a>
				</form>
				 <br clear="all" />
			</div>
			<div id="forgot">
				<a href="#" class="forgotlink"><span>After generation you'll back here</span></a>
			</div>
		</div>
	</div>
	<br clear="all" />
</body>
</html>
