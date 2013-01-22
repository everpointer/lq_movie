class Movie < ActiveRecord::Base
  serialize :director, Array
  serialize :cast, Array
  serialize :movie_type, Array
  serialize :pubdate, Array
  serialize :country, Array
  serialize :language, Array
  serialize :movie_edition, Array
  serialize :rating, Hash

  attr_accessible :image, :title
end
