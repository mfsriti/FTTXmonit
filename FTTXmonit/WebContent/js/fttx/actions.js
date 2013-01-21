var timer=null;
var seconds = 10; 

function startFailuresRefresh() {
    timer = setInterval(function() {
    	onClickTab('three', 'tab0', 'displayFails');
    }, seconds*1000);
}

function cancelFailuresRefresh() {
    clearInterval(timer);
    timer = null;
}

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
		if (params)
			page = page+"?"+params;
		xmlhttp.open("GET", page, true);
		xmlhttp.send();
	}
	
	function onClickMenu(itemId) {
		changeElement("menu", "menubar.jsp", "itemId="+itemId);
		
		var page = "#";
		if (itemId === "one") page ="home.jsp";
		if (itemId === "two") page = "showKM";
		if (itemId === "three") page = "displayFails";
		if (itemId === "four") page = "chartReport";
		if (itemId === "five") page = "listUsers";
		
		onClickTab(itemId, "tab0", page);
   	}
	
	function onClickTab(itemId, tabId, pageName) {
		if (pageName=="displayFails"){
			if (timer==null){
				startFailuresRefresh();
			}
		} else {
			cancelFailuresRefresh();
		}
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