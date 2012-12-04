function changeElement(elemId, page, params) {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(elemId).innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", page+"?"+params, true);
		xmlhttp.send();
	}
	
	function onClickMenu(itemId) {
		changeElement("menu", "menubar.jsp", "itemId="+itemId);
		changeElement("tabs", "tabbar.jsp", "itemId="+itemId+"&tabId=tab0");	
   	}
	
	function onClickTab(itemId, tabId, pageName) {
		changeElement("tabs", "tabbar.jsp", "itemId="+itemId+"&tabId="+tabId);	
	   	changeElement("content", pageName, "");
   	}
	
	function onClickButton(pageName, params) {
	   	changeElement("content", pageName, params);
   	}
	
	function postAddUserForm(form){
		var theForm = document.getElementById(form);
	    $.post(
	        theForm.action, 
	        $(theForm).serializeArray(), 
	        function(data, textStatus, xmlHttpRequest){
	            $("#content").html(data);
	        }
	    );
	    return false;
	}