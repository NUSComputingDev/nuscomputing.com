# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
	
jQuery ->
	showLoaders = ->
		$('#spinner').show()
		$('#meter').show()

	hideLoaders = ->
		$('#spinner').hide()
		$('#meter').hide()

	hideLoaders()
	$('#meter').progressbar {value: false }

	$('.button').click (e) ->
		showLoaders()
