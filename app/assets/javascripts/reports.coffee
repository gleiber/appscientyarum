# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $('#option').change ->
    option = $('#option :selected').text()
    if option == "Gráfica de pastel - Porción de respuestas a encuestas por preguntas"
      $('#div-programs').hide()
      $('#div-encuestas').show()
    else
      $('#div-programs').show()
      $('#div-encuestas').hide()
