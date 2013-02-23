class Movie < ActiveRecord::Base
  serialize :director, Array
  serialize :cast, Array
  serialize :movie_type, Array
  serialize :pubdate, Array
  serialize :country, Array
  serialize :language, Array
  serialize :movie_edition, Array
  serialize :rating, Hash

  attr_accessible :title, :image, :director, :cast, :movie_type, :pubdate,
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

  # 默认api获得的image尺寸是small的
  def large_image
   "http://img3.douban.com/lpic/s" + douban_image_id + ".jpg"
  end

  def middle_image
   "http://img3.douban.com/mpic/s" + douban_image_id + ".jpg"
  end

  def rating_average
    self.rating["average"].to_f
  end

  private

  def douban_image_id
    /pic\/s(\d*).jpg/.match(self.image)[1]
  end
end
