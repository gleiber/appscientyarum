# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#programs').change ->
		$.ajax 'update_cohort',
			type: 'GET'
			dataType: 'script'
			data: {
				program_id: $("#programs option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				$('#combo_cohort').show()
				$('#cohorte-contenedor').hide()

	$('#cohorte_select').change ->
		$.ajax 'update_cohort_planification',
			type: 'GET'
			dataType: 'script'
			data: {
				program_id: $("#programs option:selected").val(),
				cohort_id: $("#cohorte_select option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				$('#cohorte-contenedor').show()

	$('#programs_aula').change ->
		$.ajax '/update_cohort_aula',
			type: 'GET'
			dataType: 'script'
			data: {
				program_id: $("#programs_aula option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				$('#combo_cohort_aula').show()
				$('#cohorte-contenedor_aula').hide()

	$('#cohorte_select_aula').change ->
		$.ajax '/update_cohort_planification_aula',
			type: 'GET'
			dataType: 'script'
			data: {
				program_id: $("#programs_aula option:selected").val(),
				cohort_id: $("#cohorte_select_aula option:selected").val()
			}
			error: (jqXHR, textStatus, errorThrown) ->
				console.log("AJAX Error: #{textStatus}")
			success: (data, textStatus, jqXHR) ->
				$('#cohorte-contenedor_aula').show()		 		