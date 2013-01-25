class MovieSession < ActiveRecord::Base
  belongs_to :movie
  belongs_to :movie_theatre
  belongs_to :screening_room

  attr_accessible :movie_edition, :price, :screening_date, :movie_id, :movie_theatre_id, :screening_room_id

  def on_date
    screening_date.to_date
  end

  def on_time
    screening_date.to_time
  end

  def self.theday(date)
    date = Date.parse(date)
    datetime = date.to_datetime
    datetime_after = date.tomorrow.to_datetime
    where(screening_date: datetime..datetime_after)
  rescue => ex
    puts ex
    []
  end

end
