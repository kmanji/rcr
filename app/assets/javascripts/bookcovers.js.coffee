# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$(".cover-button").click () ->
		$('.hide-cover').click()


	$('.hide-cover').change () ->
		if $(this).val()
			$('.cover-button').text( $(this).val() )