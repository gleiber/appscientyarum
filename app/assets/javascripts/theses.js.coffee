# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#thesis_tracing_id').change ->
		$.ajax '/update_thesis_tracing',
			type: 'GET'
			dataType: 'script'
			data: {
				thesis_id: $("#thesis_tracing_id option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				console.log("Dynamic seguimiento select OK!")
				console.log(data)

