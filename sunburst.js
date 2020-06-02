looker.plugins.visualizations.add({
	create: function(element, config){
		element.innerHTML = "<h1>Ready to render!</h1>";
	},
	updateAsync: function(data, element, config, queryResponse, details, doneRendering){
		var html = "";
		for(var row of data) {
			var cell = row[queryResponse.fields.dimensions[0].name];
			html += LookerCharts.Utils.htmlForCell(cell);
		}
		element.innerHTML = html;
		doneRendering()
	}
});