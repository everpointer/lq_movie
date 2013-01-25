class MovieTheatre < ActiveRecord::Base
  attr_accessible :address, :area, :city, :name

  has_many :movie_sessions

  def self.at_place(city, area = nil)
    filters = { city: city }
    filters[:area] = area unless area.nil?
    where(filters)
  end
end
