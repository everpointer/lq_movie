class MoviesController < ApplicationController
  def index
  end

  def show
    @current_movie = Movie.find(params[:id])
    @movie_sessions = @current_movie.movie_sessions.includes(:movie_theatre)
  end
end
