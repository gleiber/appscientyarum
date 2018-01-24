# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#generar_contactos').click ->
    $.ajax '/update_contactos',
      type: 'GET'
      dataType: 'script'
      data: {
        type_contact_id: $("#tipo_contacto option:selected").val()
        fecha_desde: $("#fecha_desde").val()
        fecha_hasta: $("#fecha_hasta").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Se lleno los cohortes")

