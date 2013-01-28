module ApplicationHelper
  def controller_stylesheet_link_tag
    case controller_name
    when "movie_sessions"
      stylesheet_link_tag controller_name
    end
  end

  def link_for(links, html_options = {})
    return nil unless links.length > 1

    links.collect  do |link|
      link_to link[:body], link[:url], html_options
    end.join("").html_safe
  end

end
