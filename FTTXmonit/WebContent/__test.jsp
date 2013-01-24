<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/raphael/raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/g.raphael-min.js"></script>
<script type="text/javascript" src="js/raphael/raphaeljs-infobox.js"></script>

<script type="text/javascript">
function test(){
	var paper = Raphael("canvas", 500, 500);
	var infobox = new Infobox(paper, {x:10,y:10, width:250, height:250, with_border:true});
	infobox.div.html('<h1>test</h1>');
	infobox.update();
}
</script>

<title>Insert title here</title>
</head>
<body onload=test();>
<div id="canvas">
</div>
</body>
</html>