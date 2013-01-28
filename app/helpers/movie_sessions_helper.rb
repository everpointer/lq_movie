# encoding: utf-8
module MovieSessionsHelper
  # seat状态常量设置
  SEAT_NONE = nil # 无座位
  SEAT_SINGLE_AVAILABLE = 0 # 可选单人作为
  SEAT_DOUBLE_AVAILABLE = 1 # 可选双人座位
  SEAT_NOT_AVAILABLE = 2 # 不可选座位
  SEAT_TAKEN = 3 # 已选座位

  def seat_table_tag(movie_session, screening_room)
    seats = screening_room.seats
    seat_status = movie_session.seat_status
    seat_types = seat_types(seat_status)

    seat_row_tags = []
    seats.each do |row_name, seat_values|
      seat_row_tags << (content_tag :tr do
        content_tag(:th, row_name + "排") <<
        seat_tds_tag(row_name, seat_values, seat_types, screening_room)
      end)
    end

    content_tag(:table , content_tag(:tbody, seat_row_tags.join("").html_safe))
  end

  def seat_tds_tag(row_name, seat_values, seat_types, screening_room)
    tds_tag = []
    seat_values.each_with_index do |seat_value, index|
      seat_index = screening_room.seat_index(row_name, index)  # todo: 实现 LR, 返回新的index
      seat_key = ScreeningRoom.seat_key(row_name, seat_index)
      seat_title = ScreeningRoom.seat_title(row_name, seat_index)
      seat_type = seat_types[seat_key] || seat_type(seat_value)

      tds_tag << content_tag(:td, content_tag(:span), { title: seat_title, id: seat_key, class: seat_type })
    end
    tds_tag.join("").html_safe
  end

  def seat_types(seat_status)
    seat_types = {}
    seat_status.each do |seat_key, status|
      seat_types[seat_key] = seat_type(status)
    end
    seat_types
  end

  def seat_type(seat_value)
    case seat_value
    when SEAT_SINGLE_AVAILABLE
      "seat_single_available"
    when SEAT_DOUBLE_AVAILABLE
      "seat_double_available"
    when SEAT_NOT_AVAILABLE
      "seat_not_available"
    when SEAT_TAKEN
      "seat_taken" 
    else
      "seat_none"
    end
  end

end
