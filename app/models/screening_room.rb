# encoding: utf-8
class ScreeningRoom < ActiveRecord::Base
  serialize :seats, Hash
  
  attr_accessible :name, :movie_session_id, :movie_theatre_id, :order, :seats

  has_one :movie_theatre
  has_many :movie_sessions

  def self.seat_key(row_name, seat_value)
    "#{row_name}#{seat_value.to_s}" 
  end

  def self.seat_title(row_name, seat_value)
    "#{row_name}排#{seat_value.to_s}座" 
  end

  def seat_index(index)
    if order == "LR"
      index + 1
    else
      column_nums - index
    end
  end

  def row_nums
    seats.length
  end

  def column_nums
    seats[seats.keys.first].length rescue 0
  end
end
