# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	states = $('#table_offer_user').html()
	$('#offer_user_offer_id').change ->
		country = $('#offer_user_offer_id :selected').val()
		console.log country