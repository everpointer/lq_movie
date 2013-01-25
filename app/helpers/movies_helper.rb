module MoviesHelper
  def screening_date_tag(movie, i)
    date = Date.today + i
    link_to date.to_s, movie_path(movie, on_date: date), date: date.to_s
  end
end
