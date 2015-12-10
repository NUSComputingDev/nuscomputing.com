module ApplicationHelper
  def active_link_to(text, link)
    content_tag(:li, :class => request.fullpath == link ? 'active' :nil) do
      link_to text, link
    end
  end
end
