# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	cohorts = $('#cohort_id').html()
	$('#program_id').change ->
		programa = $('#program_id :selected').text()
		#options = $(cohorts).filter("optgroup[label='#{programa}']").html()
		if options
			$('#cohort_id').html("<option value=''></option>" + options)