# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#line_investigation', (evt) ->
    $.ajax 'update_areas',
      type: 'GET'
      dataType: 'script'
      data: {
        line_investigation_id: $("#line_investigation option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic program select OK!")
        console.log(data)