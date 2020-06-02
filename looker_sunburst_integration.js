looker.plugins.visualizations.add({
	create: function(element, config){
		element.innerHTML = "<h1>Ready to render!</h1>";
	},
	updateAsync: function(data, element, config, queryResponse, details, doneRendering){
        var html = `
        <div id=\"main\">  
			<div id=\"sunburst-breadcrumbs\"></div> 
			<div id=\"sunburst-chart\"> \
				<div id=\"sunburst-description\"></div> 
			</div> 
		</div> 
		<div id=\"sidebar\"> 
			<input type=\"checkbox\" id=\"togglelegend\"> Legend<br/> 
			<div id=\"sunburst-legend\" style=\"visibility: hidden;\"></div> 
		</div> 
        `;
		for(var row of data) {
            
            for(i=0; i<queryResponse.fields.dimensions.length; i++){

                var cell = row[queryResponse.fields.dimensions[i].name];
                if(cell.value != null){
                    if(i>0){
                        html += "-";
                    }
    
                    html += LookerCharts.Utils.textForCell(cell);
    
                }    
                
            }
            
            var countCell = row[queryResponse.fields.measures[0].name];
            html += " , ";
            html += LookerCharts.Utils.textForCell(countCell).replace(/,/gi,'');
            html += "<br>";
		}
		element.innerHTML = html;
		doneRendering()
	}
});