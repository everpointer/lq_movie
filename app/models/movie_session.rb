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
    if date.nil?
      []
    else
      date = Date.parse(date)
      datetime = date.to_datetime
      datetime_after = date.tomorrow.to_datetime
      where(screening_date: datetime..datetime_after)
    end
  rescue => ex
    puts ex.inspect
    []
  end

  def self.at_place(city, area = nil)
    matched_theatre_ids = MovieTheatre.at_place(city, area).collect do |theatre|
      theatre.id
    end.join(",")
    where("movie_theatre_id IN (?)", matched_theatre_ids)
  end
end
