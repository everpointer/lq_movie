# encoding: utf-8
class ScreeningRoom < ActiveRecord::Base
  serialize :seats, Hash
  
  attr_accessible :name, :movie_session_id, :movie_theatre_id, :order, :seats

  has_one :movie_theatre
  has_many :movie_sessions

  def self.seat_key(row_name, seat_value)
    if seat_value.nil?
      "none"
    else
      "#{row_name}#{seat_value.to_s}" 
    end
  end

  def self.seat_title(row_name, seat_value)
    "#{row_name}排#{seat_value.to_s}座" unless seat_value.nil?
  end

  # todo: 表结构涉及有问题，导致seat_index计算复杂，难以理解，修改重新考虑一下
  def seat_index(row_name, index)
    if seats[row_name][index].nil?
      nil
    else
      if order == "LR"
        seat_index = 0
        seats[row_name][0..index].each { |seat| seat_index+=1 unless seat.nil? }
      else
        seat_index = 0
        seats[row_name][index..column_nums-1].each { |seat| seat_index+=1 unless seat.nil? }
      end
      seat_index
    end
  end

  def row_nums
    seats.length
  end

  def column_nums
    seats[seats.keys.first].length rescue 0
  end

  def rowNames
    seats.keys
  end

end
