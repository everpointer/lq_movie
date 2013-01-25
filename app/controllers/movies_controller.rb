class MoviesController < ApplicationController
  def index
  end

  def show
    @current_movie = Movie.find(params[:id])
    city = params[:city]
    area = params[:area]

    if city.nil?
      @movie_sessions = []
    else
      @movie_sessions = @current_movie.movie_sessions.theday(params[:on_date]).at_place(city, area)
    end

  end
end
