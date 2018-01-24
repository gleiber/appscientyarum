# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#cohort_select', (evt) ->
    $.ajax 'update_periods',    
      type: 'GET'
      dataType: 'script'
      data: {
        cohort_id: $("#cohort_select option:selected").val()
        program_id: $("#program_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
        $("#idUsers").remove()
        $("#divUsers").append('<div id="idUsers"></div>')
      success: (data, textStatus, jqXHR) ->
        console.log("Metodo de Karla")
        $("#divparticipante_periodo").show()
        $("#idUsers").remove()
        $("#divUsers").append('<div id="idUsers"></div>')

  $(document).on 'change', '#program_id', (evt) ->
    $.ajax 'update_cohorts',
      type: 'GET'
      dataType: 'script'
      data: {
        program_id: $("#program_id option:selected").val()
      }
      error: (jqXH, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXH) ->
        console.log("Dynamic program select OK!")
        $("#divparticipante_periodo").hide()

  $(document).on 'change', '#cohort_select', (evt) ->
    $.ajax 'update_participantes',
      type: 'GET'
      dataType: 'script'
      data: {
        cohort_id: $("#cohort_select option:selected").val()
        program_id: $("#program_id option:selected").val()
      }
      error: (jqXH, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXH) ->
        console.log("Dynamic program select OK!")