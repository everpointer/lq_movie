class ScreeningRoom < ActiveRecord::Base
  attr_accessible :name, :movie_session_id, :movie_theatre_id, :order, :seats

  has_one :movie_theatre
  has_many :movie_sessions
end
