class MovieSession < ActiveRecord::Base
  has_one :movie

  attr_accessible :movie_edition, :price, :screening_date

end
