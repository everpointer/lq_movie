class Movie < ActiveRecord::Base
  serialize :director, Array
  serialize :cast, Array
  serialize :movie_type, Array
  serialize :pubdate, Array
  serialize :country, Array
  serialize :language, Array
  serialize :movie_edition, Array
  serialize :rating, Hash

  attr_accessible :image, :title, :image, :director, :cast, :movie_type, :pubdate,
    :country, :language, :movie_duration, :movie_edition, :rating, :summary, :douban_id, :is_screening

  has_many :movie_sessions

  scope :screening, where("is_screening = ?", true)

  def join(column)
    if self[column].instance_of?(Array)
      self[column].join('/')
    else
      self[column]
    end
  end

  def self.reset_screening
    Movie.screening.update_all("is_screening = false")
  end
end
