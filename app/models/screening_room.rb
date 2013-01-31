# encoding: utf-8
class ScreeningRoom < ActiveRecord::Base
  serialize :seats, Hash
  
  attr_accessible :name, :movie_session_id, :movie_theatre_id, :order, :seats

  has_one :movie_theatre
  has_many :movie_sessions

  STATUS_TYPES = { 
      none: 0,  # 无座位
      single_available: 1, # 可选单人座位
      double_available: 2, # 可选双人座位
      not_available: 404, # 不可选座位
      taken: 200 # 已选座位
  }

  def self.status_types
    STATUS_TYPES
  end

  # seats original seat_key => value Hash except nil seat
  def seat_statuses
    seat_statuses = {}
    seats.each do |row_name, statuses|
      statuses.each_with_index do |status, index|
        seat_index = seat_index(row_name, index)
        unless seat_index.nil?
          seat_statuses[ScreeningRoom.seat_key(row_name, seat_index)] = status
        end
      end
    end
    seat_statuses 
  end

  def self.seat_key(row_name, seat_index)
    if seat_index.nil?
      "none"
    else
      "#{row_name}:#{seat_index.to_s}" 
    end
  end

  def self.seat_title(row_name, seat_index)
    "#{row_name}排#{seat_index.to_s}座" unless seat_index.nil?
  end

  def self.seat_key_to_index(seat_key)
    unless seat_key.nil? || seat_key == "none"
      row_name, seat_index = seat_key.split(":")
      {row_name: row_name, seat_index: seat_index.to_i }
    end
  end

  # todo: 表结构涉及有问题，导致seat_index计算复杂，难以理解，修改重新考虑一下
  def seat_index(row_name, index)
    if seats[row_name][index] == ScreeningRoom.status_types[:none]
      nil
    else
      if order == "LR"
        seat_index = 0
        seats[row_name][0..index].each { |seat| seat_index+=1 unless seat == ScreeningRoom.status_types[:none] }
      else
        seat_index = 0
        seats[row_name][index..column_nums-1].each { |seat| seat_index+=1 unless seat == ScreeningRoom.status_types[:none] }
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
