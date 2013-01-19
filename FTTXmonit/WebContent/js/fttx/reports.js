function drawPie (elemId, width, height, stats) {
	var report_canvas = document.getElementById(elemId);
	report_canvas.style.width = width;
	report_canvas.style.border = "2px solid #333";
	var values = [];
	var legends = [];
	for (var s in stats) { 
		values.push(stats[s].statNumber);
		legends.push("%%.%% - " + stats[s].statComponentTypeName);
	}
	
	var r = new Raphael(report_canvas, width, height);
	//var reportPie = r.piechart(450, 225, 200, values, { legend: legends, legendpos: "east"}
	var reportPie = r.piechart(425, 275, 200, values, { legend: legends, legendpos: "east"}
    );

    reportPie.hover(function () {
        this.sector.stop();
        this.sector.scale(1.1, 1.1, this.cx, this.cy);

        if (this.label) {
            this.label[0].stop();
            this.label[0].attr({ r: 7.5 });
            this.label[1].attr({ "font-weight": 800 });
        }
    }, function () {
        this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

        if (this.label) {
            this.label[0].animate({ r: 5 }, 500, "bounce");
            this.label[1].attr({ "font-weight": 400 });
        }
    });
}
