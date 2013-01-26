class MoviesController < ApplicationController
  def index
  end

  def show
    @current_movie = Movie.find(params[:id])
    on_date = Date.parse(params[:on_date] || Date.today.to_s)
    city = params[:city]
    area = params[:area]
    theatre = params[:theatre]

    unless city.nil?
      @movie_theatres = MovieTheatre.at_place(city, area)
    end

    unless theatre.nil? || theatre.empty?
      @movie_sessions = @current_movie.movie_sessions.theday(on_date).at_theatre(theatre)
    end 

  end
end
