class MovieSessionsController < ApplicationController
  def show
    @movie_session = MovieSession.find(params[:id])
    @movie_theatre = @movie_session.movie_theatre
    @screening_room = @movie_session.screening_room
  end
end
