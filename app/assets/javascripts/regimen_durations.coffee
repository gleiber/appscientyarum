# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '#program_id_regimen', (evt) ->
    $.ajax 'update_regimen',
      type: 'GET'
      dataType: 'script'
      data: {
        program_id: $("#program_id_regimen option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic program select OK!")
        console.log(data)