class MovieSession < ActiveRecord::Base
  has_one :movie
  has_one :movie_theatre

  attr_accessible :movie_edition, :price, :screening_date

end
