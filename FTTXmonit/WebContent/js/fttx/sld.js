var sldPaper;

function initSLD(elemId, width, height) {
	var sld_canvas = document.getElementById(elemId);
	sld_canvas.style.width = width;
	sld_canvas.style.border = "2px solid #333";
	sldPaper = new Raphael(sld_canvas, width, height);
}

/*
function drawSLD() {
	var fdt1 = drawSLDFDT(sldPaper, 750, 250, 0);
	var fdt2 = drawSLDFDT(sldPaper, 850, 350, 90);
	var fdt3 = drawSLDFDT(sldPaper, 750, 450, 180);
	var fdt4 = drawSLDFDT(sldPaper, 550, 350, 270);

	var hole1 = drawSLDHole(sldPaper, 750, 50);
	var hole2 = drawSLDHole(sldPaper, 550, 150);
	var hole3 = drawSLDHole(sldPaper, 650, 350);
}
*/

function drawSLD(fdts, holes, cables , odbs, onts) {
	for ( var c in cables) {
		drawSLDCable(sldPaper, cables[c].sLDPoints); //, getCableInfoString(cables[c]));
	}
	for (var f in fdts){
		drawSLDFDT(sldPaper, fdts[f].coordX, fdts[f].coordY, fdts[f].sldPosition); //, getFDTInfoString(fdts[f]));
	}
	for ( var h in holes) {
		drawSLDHole(sldPaper, holes[h].coordX, holes[h].coordY); // getHoleInfoString(holes[h]));
	}
	//for (var o in odbs){
	//	drawODB(odbs[o].latitude, odbs[o].longitude, getODBInfoString(odbs[o]));
	//}
	//for (var o in onts){
	//	drawONT(onts[o].latitude, onts[o].longitude, getONTInfoString(onts[o]));
	//}
}

function drawSLDFDT(paper, x, y, angle) {
	if (x==0 || y==0)
		return undefined;
	var fdtH = 40, fdtW = fdtH * 3 / 4;
	var fdtH2 = fdtW / 2, fdtW2 = fdtW / 15;
	var fdtOpt = {
		fill : "#FFD0C8",//"#FF927E",
		stroke : "red",
		//"fill-opacity" : 0.2,
		"stroke-width" : 2
	};

	var fdt = paper.path("M " + (x - fdtW / 2) + "," + (y - fdtH / 2) + " l 0,"
			+ fdtH + " " + fdtW + ",0 0," + -fdtH + " z"/* +-fdtW+",0 " */
			+ "M " + (fdtW2 + x - fdtW / 2) + "," + (y - fdtH / 2) + " c0,"
			+ -(fdtH2) + " " + (fdtW - 2 * fdtW2) + "," + -(fdtH2) + " "
			+ (fdtW - 2 * fdtW2) + ",0 " + "M " + (x - fdtW / 6) + ","
			+ (y - fdtH * 3 / 8) + " l 0," + fdtH / 4 + " " + -fdtW2 + ",0 "
			+ (fdtW2 + fdtW / 6) + "," + fdtH / 4 + " 0," + fdtH / 4 + " 0,"
			+ (-fdtH / 4) + " " + (fdtW2 + fdtW / 6) + "," + (-fdtH / 4) + " "
			+ (-fdtW2) + ",0 0," + (-fdtH / 4) + " 0," + fdtH / 4 + " "
			+ (-fdtW / 6) + ",0 0," + (-fdtH / 4) + " 0," + fdtH / 4
			+ (-fdtW / 6) + ",0");
	fdt.attr(fdtOpt);
	fdt.rotate(angle, x, y);
	return fdt;
}
function drawSLDHole(paper, x, y) {
	if (x==0 || y==0)
		return undefined;
	var holeW = 20;
	var fdtOpt = {
		fill : "#B0E0E6",
		stroke : "blue",
		//"fill-opacity" : 0.2,
		"stroke-width" : 1,
		"stroke-dasharray" : "."
	};

	var hole = paper.path("M " + (x - holeW / 2) + "," + (y - holeW / 2)
			+ " l 0," + holeW + " " + holeW + ",0 0," + (-holeW) + " z");
	hole.attr(fdtOpt);
	return hole;
}
function drawSLDCable(paper, coords) {
	if (coords==null)
		return undefined;
	
	var cableOpt = {
			stroke : "black",
			"stroke-width" : 1
		};
	var pathStr = "M "+coords[0][0]+","+coords[0][1]+" L ";
	for (var i = 0; i < coords.length; i++){
		pathStr += coords[i][0]+","+coords[i][1]+" ";
	}
	var cable = paper.path(pathStr);
	cable.attr(cableOpt);
	return cable;
}
