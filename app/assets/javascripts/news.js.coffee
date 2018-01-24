# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#dirigido').change ->
		dirigido = $('#dirigido :selected').text()
		if dirigido == "Cohorte"
			$('#divsubject').toggle()
			$('#divcohort').toggle()
			$('#divlineainvestigation').hide()
			$('#divarea').hide()
		else if dirigido == "Linea de Investigación"
			$('#divlineainvestigation').toggle()
			$('#divcohort').hide()
			$('#divsubject').hide()
			$('#divarea').hide()
		else if dirigido == "Area de Interes"
			$('#divarea').toggle()
			$('#divlineainvestigation').hide()
			$('#divcohort').hide()
			$('#divsubject').hide()
		else
			$('#divsubject').hide()
			$('#divcohort').hide()
			$('#divlineainvestigation').hide()
			$('#divarea').hide()