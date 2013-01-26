# encoding: utf-8
module MoviesHelper
  CITY_AREAS = {"宁波" => ["慈溪", "余姚", "海曙", "镇海", "宁海", "江东", "北仑", "江北", "象山", "奉化", "鄞州"] }

  def screening_date_tag(movie, i)
    date = Date.today + i
    link_to date.to_s, movie_path(movie, on_date: date), date: date.to_s
  end

  def city_area_tag(movie, on_date)
    content_tag(:div) do
      CITY_AREAS.keys.collect do |city|
        areas = CITY_AREAS[city]
        links = areas.collect do |area|
          { body: area, url: movie_path(movie, on_date: on_date, city: city, area: area), html_options: {} }
        end
        # 复杂的html生成，在helper中就很难理解，比如下面的，你很难知道最终的生成结果
        content_tag :li, content_tag(:span, city + ":") << link_for(links)
      end.join("").html_safe
    end

  end

  def theatre_tag(movie, movie_theatres, params)
    unless movie_theatres.nil?
      content_tag :ul do
        content_tag_for :li, movie_theatres do |theatre|
          params[:theatre] = theatre.id
          link_to theatre.name, movie_path(movie, params)
        end     
      end
    end
  end

end
