# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_flash(type)
    return nil unless flash[type]
    body = flash[type]
    tag(:br, :style => "clear:both")+
    content_tag(:div, :id => "flash_message", :class=>type.to_s) do
      simple_format(body)
    end
  end

  def f
    return [:notice, :error, :success].map { |f| render_flash(f) }
  end


end
