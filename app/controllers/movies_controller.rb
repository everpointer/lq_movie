class MoviesController < ApplicationController
  def index
  end

  def show
    @current_movie = Movie.find(params[:id])
    @movie_sessions = @current_movie.movie_sessions.theday(params[:on_date]) # why .includes(:movie_theatre) not work?
  end
end
