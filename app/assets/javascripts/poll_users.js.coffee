# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#line_investigation_id').change ->
		$.ajax '/update_line_investigation_poll',
			type: 'GET'
			dataType: 'script'
			data: {
				line_investigation_id: $("#line_investigation_id option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				console.log("funciono")
				$('#divareaInteres').show()	
				$('#tabla').hide()

	$('#area_interest_id_poll').change ->
		$.ajax '/update_poll',
			type: 'GET'
			dataType: 'script'
			data: {
				area_interest_id: $("#area_interest_id_poll option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				console.log("funciono")
				$('#tabla').show()


				