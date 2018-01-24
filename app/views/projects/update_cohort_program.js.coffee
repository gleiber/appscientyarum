$("#cohort_program").empty()
$("#cohort_program").append("<%= escape_javascript(render(:partial => @cohort_program)) %>")