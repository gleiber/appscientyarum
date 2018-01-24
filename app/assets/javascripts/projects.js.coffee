# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#user_id').change ->
		$.ajax '/update_participante',
			type: 'GET'
			dataType: 'script'
			data: {
				user_id: $("#user_id option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				console.log("Dynamic program select OK!")
				console.log(data)

	$('#select_line').change ->
		$.ajax '/update_area_project',
			type: 'GET'
			dataType: 'script'
			data: {
				line_investigation_id: $("#select_line option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				console.log("Dynamic program select OK!")
				console.log(data)

	$('#project_tracing_id').change ->
		$.ajax '/update_project_tracing',
			type: 'GET'
			dataType: 'script'
			data: {
				project_id: $("#project_tracing_id option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				console.log("Dynamic seguimiento select OK!")
				console.log(data)

