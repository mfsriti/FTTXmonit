/** map options */
var currentUserCenter = new google.maps.LatLng(24.801417, 46.712228);
var currentUserZoom = 16;
/** end of map options */

var areaOptions = {
		fillOpacity : 0.3,
		strokeColor : "white",
		strokeOpacity : 0.5,
		strokeWeight : 3,
		geodesic : true
};	

// FDT properties
var fdtOptions = {
		fillColor : "yellow",
		fillOpacity : 1.0,
		strokeColor : "black",
		strokeOpacity : 1.0,
		strokeWeight : 2,
		geodesic : true
};
var fdtWide   = 0.000060;//30
var fdtWide2  = 0.000040;//20
var fdtHeight = 0.000100;//50

// hole properties
var holeOptions = {
		fillColor : "green",
		fillOpacity : 1.0,
		strokeColor : "black",
		strokeOpacity : 1.0,
		strokeWeight : 2,
		geodesic : true
};
var holeWide   = 0.000040;
var holeHeight = 0.000080;

// splice options
var spliceOptions = {
		fillColor : "#00FF33",
		fillOpacity : 1.0,
		strokeColor : "black",
		strokeOpacity : 1.0,
		strokeWeight : 2,
		geodesic : true
};
var spliceWide   = 0.000040;
var spliceHeight = 0.000040;

// ODB options
var fColorODB = "orange";
var fOpacityODB = 1.0;
var sColorODB = "black"; 
var sOpacityODB = 1.0;
var sWeightODB = 2;
var geodesicODB = true;

var wideODB   = 0.000020;
/** end of ODB options */

// ONT options
var fColorONT = "pink";
var fOpacityONT = 1.0;
var sColorONT = "black"; 
var sOpacityONT = 1.0;
var sWeightONT = 2;

var radiusONT   = 2; // in meters
/** end of ODB options */

// cable options
var cableOptions = {
		strokeColor : "blue",
		strokeOpacity : 1.0,
		geodesic : true
};
var sWeightCable288 = 10;
var sWeightCable144 = 8;
var sWeightCable96 = 6;
var sWeightCable36 = 4;
var sWeightCable24 = 4;
var sWeightCable12 = 2;
var sWeightCable8 = 2;


/** ** icon for FDT ** */
var image = new google.maps.MarkerImage('images/keymap/fdt_down.png',
		new google.maps.Size(48, 48), new google.maps.Point(0, 0),
		new google.maps.Point(0, 35));

// The map as global variable
var map;

function initMap(elemId, height) {
	var mapOptions = {
		center : currentUserCenter,
		zoom : currentUserZoom,
		mapTypeId : google.maps.MapTypeId.SATELLITE
	// .ROADMAP
	};
	var map_canvas = document.getElementById(elemId);
	map_canvas.style.height = height;
	map = new google.maps.Map(map_canvas, mapOptions);
}

function displayEditMarker(position) {
	        var marker = new google.maps.Marker({
				position : position,
				map : map,
				draggable : true,
	
			});
	        document.getElementById("latlng").value = position.lat().toFixed(6)+"*1000000, "+position.lng().toFixed(6)+"*1000000";
	        
	        google.maps.event.addListener(marker, "dragend", function() {
	        	var p = marker.getPosition();
	        	document.getElementById("latlng").value = p.lat().toFixed(6)+"*1000000, "+p.lng().toFixed(6)+"*1000000";
	        	document.getElementById("latlng").focus();
	        	document.getElementById("latlng").select();
	        });
}

function drawKeyMap(fdts, holes, cables , splices, odbs, onts, failMode) { // new version with json object
	
	if (true)// in the future replace the condition with the state of the checkbox
		displayEditMarker(currentUserCenter);
	// draw FDT areas first
	for (var a in fdts) { 
		drawArea(fdts[a].gPSPoints, '#'+Math.floor(Math.random()*16777215).toString(16), fdts[a].latitude, fdts[a].longitude, getAreaInfoString(fdts[a]));
	}
	// after, draw cables
	for ( var c in cables) {
		drawCable(cables[c].gPSPoints, cables[c].size, failMode, getCableInfoString(cables[c]));
	}
	// then, add FDT, Holes and ODBs icons
	for (var f in fdts) {
		drawFDT(fdts[f].latitude, fdts[f].longitude, getFDTInfoString(fdts[f]));
		//addImageMarker(fdts[f].latitude, fdts[f].longitude, getFDTInfoString(fdts[f]));
	}
	for ( var h in holes) {
		drawHole(holes[h].latitude, holes[h].longitude, getHoleInfoString(holes[h]));
	}
	for ( var s in splices) {
		drawSplice(splices[s].latitude, splices[s].longitude, getSpliceInfoString(splices[s]));
	}
	// then, add FDT and Holes icons
	for (var o in odbs) {
		drawODB(odbs[o].latitude, odbs[o].longitude, getODBInfoString(odbs[o]));
	}
	// then, add FDT and Holes icons
	for (var o in onts) {
		drawONT(onts[o].latitude, onts[o].longitude, getONTInfoString(onts[o]));
	}
}

function drawArea(coords, fColor, lat, lng, infos) {

	areaOptions.fillColor = fColor;
	var area = drawPolygon(coords, areaOptions);
	var position = new google.maps.LatLng(lat, lng); //Area infobox is centered on the fdt position (lat/lng)
	attachInfoBox(area, position, infos);
	return area;
}

function drawCable(coords, size, failMode, infos) {
	switch (size){
		case 288: sWeightCable = sWeightCable288;
		break;
		case 144: sWeightCable = sWeightCable144;
		break;
		case 96: sWeightCable = sWeightCable96;
		break;
		case 36: sWeightCable = sWeightCable36;
		break;
		case 24: sWeightCable = sWeightCable24;
		break;
		case 12: sWeightCable = sWeightCable12;
		break;
		case 8: sWeightCable = sWeightCable8;
		break;
		default:;
	}
	cableOptions.strokeWeight = sWeightCable;
	if(failMode)
		cableOptions.strokeColor = "red";
	else
		cableOptions.strokeColor = "blue";
		
	var cable = drawPolyline(coords, cableOptions);
	var position = new google.maps.LatLng(coords[0][0], coords[0][1]); //Cable infobox is centered on the first point (lat/lng)
	attachInfoBox(cable, position, infos);
	return cable;
}


function drawFDT(lat,lng, infos){
	var coords = new Array();
	for (var i = 0; i < 15; i++)
		coords[i] = new Array();
	coords[0][0]= lat; 
	coords[0][1]= lng-fdtWide;
	coords[1][0]= lat-fdtHeight;
	coords[1][1]= lng;
	coords[2][0]= lat-(2*fdtHeight);
	coords[2][1]= lng;
	coords[3][0]= lat-fdtHeight;
	coords[3][1]= lng;
	coords[4][0]= lat;
	coords[4][1]= lng+fdtWide;
	coords[5][0]= lat;
	coords[5][1]= lng+fdtWide2; 
	coords[6][0]= lat+fdtHeight;
	coords[6][1]= lng+fdtWide2;
	coords[7][0]= lat;
	coords[7][1]= lng+fdtWide2;
	coords[8][0]= lat;
	coords[8][1]= lng;
	coords[9][0]= lat+fdtHeight;
	coords[9][1]= lng;
	coords[10][0]= lat;
	coords[10][1]= lng;
	coords[11][0]= lat;
	coords[11][1]= lng-fdtWide2;
	coords[12][0]= lat+fdtHeight;
	coords[12][1]= lng-fdtWide2;
	coords[13][0]= lat;
	coords[13][1]= lng-fdtWide2;
	coords[14][0]= lat;
	coords[14][1]= lng-fdtWide2;
	
	var fdt = drawPolygon(coords, fdtOptions);
	var position = new google.maps.LatLng(lat, lng);
	attachInfoBox(fdt, position, infos);
	return fdt;
}

function drawHole(lat,lng, infos){
	var coords = new Array();
	for (var i = 0; i < 4; i++)
		coords[i] = new Array();
	coords[0][0]= lat-holeWide;
	coords[0][1]= lng+holeHeight;
	coords[1][0]= lat-holeWide;
	coords[1][1]= lng-holeHeight;
	coords[2][0]= lat+holeWide;
	coords[2][1]= lng-holeHeight;
	coords[3][0]= lat+holeWide;
	coords[3][1]= lng+holeHeight;

	var hole = drawPolygon(coords, holeOptions);
	var position = new google.maps.LatLng(lat, lng);
	attachInfoBox(hole, position, infos);
	return hole;
}

function drawSplice(lat,lng, infos){
	var coords = new Array();
	for (var i = 0; i < 4; i++)
		coords[i] = new Array();
	coords[0][0]= lat-spliceWide;
	coords[0][1]= lng+spliceHeight;
	coords[1][0]= lat-spliceWide;
	coords[1][1]= lng-spliceHeight;
	coords[2][0]= lat+spliceWide;
	coords[2][1]= lng-spliceHeight;
	coords[3][0]= lat+spliceWide;
	coords[3][1]= lng+spliceHeight;
	
	var splice = drawPolygon(coords, spliceOptions);
	var position = new google.maps.LatLng(lat, lng);
	attachInfoBox(splice, position, infos);
	return splice;
}

function drawODB(lat,lng, infos){
	var coords = new Array();
	for (var i = 0; i < 4; i++)
		coords[i] = new Array();
	coords[0][0]= lat-wideODB;
	coords[0][1]= lng+wideODB;
	coords[1][0]= lat-wideODB;
	coords[1][1]= lng-wideODB;
	coords[2][0]= lat+wideODB;
	coords[2][1]= lng-wideODB;
	coords[3][0]= lat+wideODB;
	coords[3][1]= lng+wideODB;
	
	var odbOptions = {
			fillColor : fColorODB,
			fillOpacity : fOpacityODB,
			strokeColor : sColorODB,
			strokeOpacity : sOpacityODB,
			strokeWeight : sWeightODB,
			geodesic : geodesicODB
	};
	
	var odb = drawPolygon(coords, odbOptions);
	var position = new google.maps.LatLng(lat, lng);
	attachInfoBox(odb, position, infos);
	return odb;
}

function drawONT(lat,lng, infos){
	var ontOptions = {
			fillColor : fColorONT,
			fillOpacity : fOpacityONT,
			strokeColor : sColorONT,
			strokeOpacity : sOpacityONT,
			strokeWeight : sWeightONT,
			radius : radiusONT
	};
	
	var ont = drawCircle(lat, lng, ontOptions);
	var position = new google.maps.LatLng(lat, lng);
	attachInfoBox(ont, position, infos);
	return ont;
}

function drawPolygon(coords, options){
	var path = Array();
	for ( var i = 0; i < coords.length; i++) {
		path[i] = new google.maps.LatLng(coords[i][0], coords[i][1]);
	}
		
	var polygon = new google.maps.Polygon(options);
	polygon.setPath(path);
	polygon.setMap(map);

//	attachPolygonInfoWindow(polygon, infos);
	return polygon;	
}

function drawPolyline(coords, options){
	var path = Array();
	for ( var i = 0; i < coords.length; i++) {
		path[i] = new google.maps.LatLng(coords[i][0], coords[i][1]);
	}
		
	var polygon = new google.maps.Polyline(options);
	polygon.setPath(path);
	polygon.setMap(map);
	return polygon;	
}

function drawCircle(lat, lng, options){
	var center = new google.maps.LatLng(lat,lng);
	var circle = new google.maps.Circle(options);
	circle.setCenter(center);
	circle.setMap(map);
	return circle;	
}


function addImageMarker(lat, lng, infos) {
	var marker = new google.maps.Marker({
		position : new google.maps.LatLng(lat, lng),
		map : map,
		draggable : false,
		animation : google.maps.Animation.DROP,
		icon : image
	});
	
	attachInfoBox2(marker, infos);
	return marker;
}




function attachPolygonInfoWindow(polygon, html)
{
	polygon.infoWindow = new google.maps.InfoWindow({
		content: html,
	});
	google.maps.event.addListener(polygon, 'mouseover', function(e) {
		var latLng = e.latLng;
		//this.setOptions({fillOpacity:0.1});
		polygon.infoWindow.setPosition(latLng);
		polygon.infoWindow.open(map);
	});
	google.maps.event.addListener(polygon, 'mouseout', function() {
		//this.setOptions({fillOpacity:0.35});
		polygon.infoWindow.close();
	});
}

// SUPER IDEA: create only one marker, onfire mouse over change text and position... 
// for position is simple see google doc, I thik panTo()
// but for the text we can create a new div
// so the marker will be global variable:
// - hidden with the currentUserPosition
// - but the div is created every time we call attaInfoBox: try to update onlu the content option, if not possible update all options
function attachInfoBox(shape, position, text)
{
	var marker = new google.maps.Marker({
        map: map,
        position: position,
        visible: false
    });
               
    var boxText = document.createElement("div");
    boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: yellow; padding: 5px;";
    boxText.innerHTML = text;
               
    var boxOptions = {
        content: boxText,
        disableAutoPan: false,
        maxWidth: 0,
        pixelOffset: new google.maps.Size(-140, 0),
        zIndex: null,
        boxStyle: { 
         background: "url('tipbox.gif') no-repeat",
         opacity: 0.75,
         width: "280px"
        },
        closeBoxMargin: "10px 2px 2px 2px",
        closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
        infoBoxClearance: new google.maps.Size(1, 1),
        isHidden: false,
        pane: "floatPane",
        enableEventPropagation: false
    };

    var ib = new InfoBox(boxOptions);
    // listener responds to a click inside polygon
    google.maps.event.addListener(shape, "rightclick", function (e) {
    	ib.open(map, marker);
    });
    google.maps.event.addListener(marker, "click", function (e) {
    	ib.close();
    });	
}

function attachInfoBox2(marker, text)
{
               
    var boxText = document.createElement("div");
    boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: yellow; padding: 5px;";
    boxText.innerHTML = text;
               
    var boxOptions = {
        content: boxText,
        disableAutoPan: false,
        maxWidth: 0,
        pixelOffset: new google.maps.Size(-140, 0),
        zIndex: null,
        boxStyle: { 
         background: "url('tipbox.gif') no-repeat",
         opacity: 0.75,
         width: "280px"
        },
        closeBoxMargin: "10px 2px 2px 2px",
        closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
        infoBoxClearance: new google.maps.Size(1, 1),
        isHidden: false,
        pane: "floatPane",
        enableEventPropagation: false
    };

    var ib = new InfoBox(boxOptions);
    // listener responds to a click inside polygon
    google.maps.event.addListener(marker, "mouseover", function (e) {
    	ib.open(map, marker);
    });
    google.maps.event.addListener(marker, "mouseout", function (e) {
    	ib.close();
    });	
}


function getAreaInfoString(a){
	var infoString;
	infoString  = "Area desserved by: <B>"+a.componentID+"</B><BR>";
	infoString += "GPS coords: <I>"+a.gPSPoints+"</I>";
	return infoString;
}

function getCableInfoString(c) {
	var infoString;
	infoString  = "Cable ID: <B>"+c.componentID+"</B><BR>";
	infoString += "Cable size: <B>"+c.size+"</B><BR>";
	infoString += "GPS coords: <I>"+c.gPSPoints+"</I>";
	return infoString;
}

function getFDTInfoString(f) {
	var infoString;
	infoString  = "FDT ID: <B>"+f.componentID+"</B><BR>";
	infoString += "DIST. TO OLT: <B>"+ f.distanceFromOLT+"</B><BR>";
	infoString += "GPS COORDS: <I>"+f.latitude+"/"+f.longitude+"</I>";
	return infoString;
}

function getHoleInfoString(h) {
	var infoString;
	infoString  = "Hole ID: <B>"+h.componentID+"</B><BR>";
	infoString += "GPS coords: <I>"+h.latitude+"/"+h.longitude+"</I>";
	return infoString;
}

function getSpliceInfoString(s) {
	var infoString;
	infoString  = "Splice ID: <B>"+s.componentID+"</B><BR>";
	infoString += "GPS coords: <I>"+s.latitude+"/"+s.longitude+"</I>";
	return infoString;
}

function getODBInfoString(o) {
	var infoString;
	infoString  = "ODB ID: <B>"+o.componentID+"</B><BR>";
	infoString += "GPS coords: <I>"+o.latitude+"/"+o.longitude+"</I>";
	return infoString;
}

function getONTInfoString(o) {
	var infoString;
	infoString  = "ONT ID: <B>"+o.componentID+"</B><BR>";
	infoString += "GPS coords: <I>"+o.latitude+"/"+o.longitude+"</I>";
	return infoString;
}

