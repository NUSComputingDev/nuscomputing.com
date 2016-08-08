# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	widget_unit_size = $(".gridster").width() / 6
	gridster = $('.gridster ul').gridster
		widget_margins: [5, 5],
		widget_base_dimensions: [widget_unit_size - 10, widget_unit_size - 10], # Minus margin
		resize:
			enabled: true
		max_cols: 6,
		min_cols: 6
	.data('gridster')

	$('.slick').slick()

	$('#next-button').click ->
	  $('.slick-next').click()

	$('#prev-button').click ->
		$('.slick-prev').click()

	widgetExists = (i) ->
		$("#widget-#{i}").length

	createWidget = (i) ->
		ratio = parseInt($('input[type="radio"][name="ratio"]:checked').val())
		orientation = $('input[type="radio"][name="orientation"]:checked').val()
		img_w = txt_w = "12"
		img_h = txt_h = "100%"
		switch ratio
			when 0 # 4 : 0
				txt_w = "0"
				txt_h = "0%"
			when 1 # 3 : 1
				if orientation == "horiz"
					img_w = "9"
					txt_w = "3"
				else
					img_h = "75%"
					txt_h = "25%"
			when 2 # 2 : 2
				if orientation == "horiz"
					img_w = "6"
					txt_w = "6"
				else
					img_h = "50%"
					txt_h = "50%"
			when 3 # 1 : 3
				if orientation == "horiz"
					img_w = "3"
					txt_w = "9"
				else
					img_h = "25%"
					txt_h = "75%"
			when 4 # 0 : 4
				img_w = "0"
				img_h = "0%"
		img = "<div class='columns small-#{img_w}' 
								style='height:#{img_h};position:relative;'>#{$('.slick-current .request-img').html()}</div>"
		txt = "<div class='columns small-#{txt_w}' display:'table-cell' style='height:#{txt_h}; position:relative;'>#{$('.slick-current .request-txt').html()}</div>"
		return "<li class='gs-w' id='widget-#{i}'><div class='row'>" + img + txt + "</div></li>"

	$('#add-button').click ->
		index = parseInt $('.slick-current .request-id').html()
		if !widgetExists(index)
			widget = createWidget(index)
			gridster.add_widget widget, 6, 2, 1, 1
		else
			$("#widget-#{index}").effect "highlight"

	$('#del-button').click ->
		index = parseInt $('.slick-current .request-id').html()
		if widgetExists(index)
			gridster.remove_widget $("#widget-#{index}")
			
	$('.minicolors-input').on 'change', ->
		$('#gridster-container').css('background', "#{$(this).val()}")
