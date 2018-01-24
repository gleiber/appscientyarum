# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#programa_nota').change ->
    $('#combo_cohort').show()
    $('#combo_cohorte_periodo').hide()
    $('#combo_materia').hide()
    $('#form_participantes').hide()
    $.ajax '/update_cohorte_nota',
      type: 'GET'
      dataType: 'script'
      data: {
        program_id: $("#programa_nota option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Se lleno los cohortes")

  $('#cohorte_nota').change ->
    $('#combo_cohorte_periodo').show()
    $('#combo_materia').hide()
    $('#form_participantes').hide()
    $.ajax '/update_cohorte_periodo_nota',
      type: 'GET'
      dataType: 'script'
      data: {
        cohort_id: $("#cohorte_nota option:selected").val()
        program_id: $("#programa_nota option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Se lleno los periodos")

  $('#cohorte_periodo_nota').change ->
    $('#combo_materia').show()
    $('#form_participantes').hide()
    $.ajax '/update_cohorte_periodo_materia_nota',
      type: 'GET'
      dataType: 'script'
      data: {
        cohort_period_id: $("#cohorte_periodo_nota option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Se lleno Combo Materia")
        

  $('#coh_per_sub_u_nota').change ->
    $('#form_participantes').show()
    $.ajax '/update_participante_nota',
      type: 'GET'
      dataType: 'script'
      data: {
        coh_per_sub_u_id: $("#coh_per_sub_u_nota option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic program select OK!")
        console.log(data)
