$("#div_cohort").empty().append('
        <select class="form-control selectpicker" id="cohort_select" name="cohort_select">
        "title"=>"Seleccione un Periodo"</select>')
$("#cohort_select").empty()
$("#cohort_select").html("<option value=''>Seleccione una Cohorte</option>")
$("#cohort_select").append("<%= escape_javascript(render(:partial => @cohorts)) %>")



$('.selectpicker').selectpicker('refresh')