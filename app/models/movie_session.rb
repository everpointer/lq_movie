class MovieSession < ActiveRecord::Base
  serialize :seat_status, Hash

  belongs_to :movie
  belongs_to :movie_theatre
  belongs_to :screening_room

  has_many :session_orders

  attr_accessible :movie_edition, :price, :screening_date, :movie_id, :movie_theatre_id, :screening_room_id, :seat_status

  scope :at_theatre, ->(movie_theatre_id) { where(movie_theatre_id: movie_theatre_id) }

  def on_date
    screening_date.to_date
  end

  def on_time
    screening_date.strftime("%H:%M")
  end

  def self.theday(date)
    if date.nil? || !date.instance_of?(Date)
      []
    else
      datetime = date.to_datetime
      datetime_after = date.tomorrow.to_datetime
      where(screening_date: datetime..datetime_after)
    end
  rescue => ex
    puts "Exception:" + ex.inspect
    []
  end

  def self.at_theatres(movie_theatres)
    theatre_ids = movie_theatres.collect do |theatre|
      theatre.id
    end.join(",")
    where("movie_theatre_id IN (?)", theatre_ids)
  end

end
