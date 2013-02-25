module ApplicationHelper
  def controller_stylesheet_link_tag
    case controller_name
    when "index", "movie_sessions", "movies"
      stylesheet_link_tag controller_name
    end
  end

  def controller_javascript_include_tag
        case controller_name
        when "index", "movie_sessions", "movies"
          javascript_include_tag controller_name
        end
  end

  def link_for(links, html_options = {})
    return nil unless links.length > 1

    links.collect  do |link|
      link_to link[:body], link[:url], html_options
    end.join("").html_safe
  end

  def rating_stars_tag(rating)
    half_rating = rating / 2
    rating_floor = half_rating.floor
    rating_rest = if half_rating - rating_floor >= 0.5
      "5"
    else
      "0"
    end

    rating_stars_class = "rating-stars" + rating_floor.to_s + rating_rest

    content_tag :span, "", :class => "rating-star " + rating_stars_class
  end

end
