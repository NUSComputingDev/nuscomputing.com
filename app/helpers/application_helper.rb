module ApplicationHelper
	def active_page(path)
		"active" if current_page?(path)
	end

	def title(page_title)
		content_for :title, page_title.to_s
	end

	def local_time(time)
		time.localtime.strftime("%d %b, %Y %H:%M")
	end

	def sortable(column, model, default, title = nil)
		title ||= column.titleize
		css_class = column == sort_column(model, default) ? "current #{sort_direction}" : nil
		direction = column == sort_column(model, default) && sort_direction == "asc" ? "desc" : "asc"
		link_to title, {sort: column, direction: direction}, class: css_class
	end
end
