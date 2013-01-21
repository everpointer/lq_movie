class IndexController < ApplicationController
  def index
    @screening_movies = Movie.all
  end
end
