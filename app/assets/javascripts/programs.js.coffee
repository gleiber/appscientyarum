# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#program_id_line', (evt) ->
    $.ajax 'update_lines',
      type: 'GET'
      dataType: 'script'
      data: {
        program_id: $("#program_id_line option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic program select OK!")
        console.log(data)



  $(document).on 'change', '#program_id_gp', (evt) ->
    $.ajax '/update_profiles',
      type: 'GET'
      dataType: 'script'
      data: {
        program_id: $("#program_id_gp option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic program select OK!")
        console.log(data)




  $(document).on 'change', '#program_id_regimen', (evt) ->
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
  
  $(document).on 'submit', '#prueba', (evt) ->
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
  
  $(document).on 'click', '#btn_subject_regimen_duration', (evt) ->
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