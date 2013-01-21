class MoviesController < ApplicationController
  def index
  end

  def show
    @current_movie = Movie.find(params[:id])
  end
end
