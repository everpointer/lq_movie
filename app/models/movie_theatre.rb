class MovieTheatre < ActiveRecord::Base
  attr_accessible :address, :area, :city, :name

  has_many :movie_sessions
end
