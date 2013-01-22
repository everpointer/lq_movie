class IndexController < ApplicationController
  def index
    @screening_movies = Movie.screening
  end
end
