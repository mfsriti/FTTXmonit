<%@page import="sa.edu.ksu.psatri.fttxmonit.beans.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FTTX Monitoring | Login</title>
<link href="css/960.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/text.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/login.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">  
    function submitOnEnter(inputElement, event) {  
        if (event.keyCode == 13) {
            inputElement.form.submit();  
        }  
    }  
</script> 
</head>

<body>
	<div class="container_16">
		<div class="grid_6 prefix_5 suffix_5">
			<h1>Welcome to FTTX Monitoring Application</h1>
			<div id="login">
				<p class="tip">Please Log In</p>
<% 
UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));

if (currentUser != null && ! currentUser.isValid()) {
%>
				<p class="error">Invalid username or passowrd, please try again!</p>
<%
}
%>
				<form action="login">
					<p>
						<label><strong>Username</strong> <input type="text"
							name="username" class="inputText" id="textfield"  
							onkeypress="submitOnEnter(this, event);" /> </label>
					</p>
					<p>
						<label><strong>Password</strong> <input type="password"
							name="password" class="inputText" id="textfield2"  
							onkeypress="submitOnEnter(this, event);" /> </label>
					</p>

					<a class="black_button" href="#"
						onclick="document.forms[0].submit()"><span>Authentification</span></a>
				</form>
				<label> <input type="checkbox" name="checkbox" id="checkbox" />
					Remember me
				</label> <br clear="all" />
			</div>
			<div id="forgot">
				<a href="mailto:admin@fttxmonit.com" class="forgotlink"><span>Forgot
						your username or password?</span></a>
			</div>
		</div>
	</div>
	<br clear="all" />
</body>
</html>
