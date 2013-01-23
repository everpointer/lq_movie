class MovieSession < ActiveRecord::Base
  belongs_to :movie
  belongs_to :movie_theatre
  belongs_to :screening_room

  attr_accessible :movie_edition, :price, :screening_date, :movie_id, :movie_theatre_id, :screening_room_id

end
