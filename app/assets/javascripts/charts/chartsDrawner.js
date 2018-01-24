function drawBackgroundColor() {
    $.ajax({
        type: "GET",
        url: "/reportes/render_postulates_json",
        dataType: "json",
        success: function(datum){
            var programas = datum["programas"]
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'programs');
            data.addColumn('number', 'Slices');
            data.addRows(datum["programas"].length);
            for(var i = 0; i< datum["contadores"].length; i++){
                data.setCell(i,0,String(datum["programas"][i].titulo));
                data.setCell(i,1,Number(datum["contadores"][i]));
            }
            var options = {'title':
                'Porción de egresados del postgrado distribuido por programas',
                'width':"100%",
                'height':454,
                colors: ['#1f4bae', '#0a2270', '#6acccc', '#59aaf2', '#91c6f7','#fca000'],
                is3D: true
            };
            // Instantiate and draw our chart, passing in some options.
            google.visualization.events.addListener(data, 'select', selectHandler)
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var value = datum["programas"][selectedItem.row]
                    visualizarDetalles(value)
                }
            }
            // Listen for the 'select' event, and call my function selectHandler() when
            // the user selects something on the chart.
            google.visualization.events.addListener(chart, 'select', selectHandler);
            chart.draw(data, options);
        }
    });



















    var data = new google.visualization.DataTable();
    data.addColumn('number', 'time');
    data.addColumn('number', 'Demanda de: Maestria en Ciencias de la Computación Mención: Inteligencia ' +
        'Artificial');
    data.addRows([
        [1, 2],   [2, 10],  [3, 11],  [4, 12],  [5, 25],  [6, 39],
        [7, 20]
    ]);
    var options = {
        curveType: 'function',
        'width':1024,
        'height':454,
        hAxis: {
            title: 'Tiempo'
        },
        colors: ['#1f4bae', '#0a2270', '#6acccc', '#59aaf2', '#91c6f7','#fca000'],
        vAxis: {
            title: 'Demanda'
        },
        backgroundColor: '#F6F5F7'
    };
    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}
function drawMultSeries(){
    $.ajax({
        type: "GET",
        url: "/reportes/render_program_json",
        dataType: "json",
        success: function(datum){
            var programas = datum["programas"]
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Programas');
            data.addColumn('number', 'Número de trabajos inscritos ');
            data.addColumn('number', 'Tésis o Trabajos especiales de grados presentados ');
            data.addRows(datum["programas"].length);
            for(var i = 0; i< datum["contadores"].length; i++){
                data.setCell(i,0,String(datum["programas"][i].titulo));
                data.setCell(i,1,Number(datum["contadores_project"][i]));
                data.setCell(i,2,Number(datum["contadores"][i]));
            }
            var options = {
                title: 'Relación de proyectos publicados  y tesis o TEG  por programas ',
                'width': "100%",
                'height':454,
                chartArea: {width: '50%'},
                colors: ['#1f4bae', '#fca000', '#6acccc', '#59aaf2', '#91c6f7','#0a2270'],
                hAxis: {
                     title: 'Total de trabajos',
                     // minValue: datum["contadores_project"].length,
                      maxValue: 10,
                    viewWindow:{min:0}, /*this also makes 0 = min value*/
                    format: '0',
                },
                vAxis: {
                    title: 'Programas'
                }
            };
            var chartBar = new google.visualization.BarChart(document.getElementById('chart_div'));
            function selectHandlerBarra() {
                var selectedItem = chartBar.getSelection()[0];
                var descrip = "proyecto"
                if (selectedItem) {
                    var value = datum["programas"][selectedItem.row]
                     visualizarDetallesBarra(value)
                }
            }
            google.visualization.events.addListener(chartBar, 'select', selectHandlerBarra);
            chartBar.draw(data, options);
        }
    });
}
function drawChartPie() {
    $.ajax({
        type: "GET",
        url: "/reportes/render_program_json",
        dataType: "json",
        success: function(datum){
            var programas = datum["programas"]
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'programs');
            data.addColumn('number', 'Slices');
            data.addRows(datum["programas"].length);
            for(var i = 0; i< datum["contadores"].length; i++){
                data.setCell(i,0,String(datum["programas"][i].titulo));
                data.setCell(i,1,Number(datum["contadores"][i]));
            }
            var options = {'title':
                'Porción de egresados del postgrado distribuido por programas',
                'width':"100%",
                'height':454,
                colors: ['#1f4bae', '#0a2270', '#6acccc', '#59aaf2', '#91c6f7','#fca000'],
                is3D: true
            };
            // Instantiate and draw our chart, passing in some options.
            google.visualization.events.addListener(data, 'select', selectHandler)
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var value = datum["programas"][selectedItem.row]
                    visualizarDetalles(value)
                }
            }
            // Listen for the 'select' event, and call my function selectHandler() when
            // the user selects something on the chart.
            google.visualization.events.addListener(chart, 'select', selectHandler);
            chart.draw(data, options);
        }
    });
}

function drawChartPieInteresados() {
    $.ajax({
        type: "GET",
        url: "/reportes/render_program_json",
        dataType: "json",
        success: function(datum){
            var programas = datum["programas"]
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'programs');
            data.addColumn('number', 'Slices');
            data.addRows(datum["programas"].length);
            for(var i = 0; i< datum["programas"].length; i++){
                data.setCell(i,0,String(datum["programas"][i].titulo));
                data.setCell(i,1,Number(datum["interesados"][i]));
            }
            var options = {'title':
                'Porción de interesados del postgrado distribuido por programas',
                'width':"100%",
                'height':454,
                colors: ['#1f4bae', '#0a2270', '#6acccc', '#59aaf2', '#91c6f7','#fca000'],
                is3D: true
            };
            // Instantiate and draw our chart, passing in some options.
            // google.visualization.events.addListener(data, 'select', selectHandler)
             var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var value = datum["programas"][selectedItem.row]
                    visualizarDetallesInteresados(value)
                }
            }
            // Listen for the 'select' event, and call my function selectHandler() when
            // the user selects something on the chart.
            google.visualization.events.addListener(chart, 'select', selectHandler);
            chart.draw(data, options);
        }
    });
}
function drawStacked(question) {
    $.ajax({
        type: "GET",
        url: "/reportes/render_question_answer_json?id="+question,
        dataType: "json",
        success: function(datum){
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Respuestas');
            data.addColumn('number', 'Número de respuestas');
            data.addRows(datum["respuestas"].length);
            for(var i = 0; i< datum["respuestas"].length; i++){
                data.setCell(i,0,String(datum["respuestas"][i]));
                data.setCell(i,1,Number(datum["contador_respuestas"][i]));
            }
            var options = {
                title: 'Número de respuestas por pregunta: '+datum["titulo"],
                isStacked: true,
                'width':"100%",
                'height':800,
                hAxis: {
                    title: 'Respuestas',
                    viewWindow: {
                        min: [0],
                        max: [datum["respuestas"].length]
                    }
                },
                vAxis: {
                    title: 'Número de respuestas',
                    viewWindow: {
                        min: [0],
                        max: [10]
                    }
                }
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_stacked'));
            chart.draw(data, options);
        }
    });
}

function drawChartPieEncuesta() {
    $.ajax({
        type: "GET",
        url: "/reportes/render_genre_poll_json",
        dataType: "json",
        success: function(datum){
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Sexos');
            data.addColumn('number', 'Slices');
            data.addRows(datum["sexos"].length);
            for(var i = 0; i< datum["sexos"].length; i++){
                data.setCell(i,0,String(datum["sexos"][i]));
                data.setCell(i,1,Number(datum["sexos_counter"][i]));
            }
            var options = {'title':
                'Porción de participantes que respondieron a la encuesta: '+datum["titulo"]+', distribuido por sexos',
                'width':"100%",
                'height':454,
                colors: ['#1f4bae', '#0a2270', '#6acccc', '#59aaf2', '#91c6f7','#fca000'],
                is3D: true
            };
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    });
}
function toggleContent (elements) {
    elements = elements.length ? elements : [elements];
    for (var index = 0; index < elements.length; index++) {
        if(elements[index].style.display == 'none')
            elements[index].style.display = 'block';
    }
}
function visualizarDetalles(data){
    toggleContent(document.getElementById('table_pie_details'));
    $("#b_detail_line").text(data.titulo);
    $.post("/reportes/clasifications",{program: data},function(data){
        $("#table_details").find("tr:gt(0)").remove();
        for(var i = 0; i < data["usuarios"].length; i++){
            $('#table_details > tbody:last-child').append('<tr><td>'+data["usuarios"][i].nombre+'</td><td>'+data["califications"][i].calification +'</td><td>'+data["califications"][i].comment +'</td></tr>');
        }
    });

}
function visualizarDetallesInteresados(data){
    toggleContent(document.getElementById('table_pie_details'));
    $("#b_detail_line").text(data.titulo);
    $.post("/reportes/interested",{program: data},function(data){
        $("#table_details").find("tr:gt(0)").remove();
        for(var i = 0; i < data["interesados"].length; i++){
            $('#table_details > tbody:last-child').append('<tr><td>'+data["interesados"][i].nombre+'</td><td>'+data["interesados"][i].email +'</td><td>'+data["interesados"][i].telefono +'</td></tr>');
        }
    });
}
function visualizarDetallesBarra(data){
    toggleContent(document.getElementById('table_detail'));
    $.post("/reportes/thesis_program",{program: data},function(data){
            $("#table_details").find("tr:gt(0)").remove();
        for(var i = 0; i < data["theses"].length; i++){
            $('#table_details > tbody:last-child').append('<tr><td>'+data["theses"][i][0].titulo+'</td><td>'+data["usuarios"][i].nombre +'</td><td>'+data["theses"][i][0].tutor +'</td></tr>');
        }
    });
    $("#b_detail_bar").text(data.titulo);
}


