# encoding: utf-8
require 'spec_helper'

describe "Movie Sessions" do
  describe "GET /movie_sessions/:id" do
    let!(:movie_session) { FactoryGirl.create(:movie_session) }
    let!(:screening_room) { movie_session.screening_room }

    before do
      visit movie_session_path(movie_session)
    end

    it "should view a movie session", :js => true do
      page.should have_content movie_session.screening_room.name

      within "table>tbody" do
        all("tr").length.should == screening_room.row_nums
        first("tr").all("td").length.should == screening_room.column_nums

        td_row_unnil_seats = first("tr").all("td").to_a.delete_if { |td| td[:class] == "seat_none" }
        d_first_seat = td_row_unnil_seats.first
        # todo: 目前是静态复制，最好改成动态的
        first_row_name = screening_room.rowNames[0]
        first_unnil_seat_index = 1
        d_first_seat[:id].should == ScreeningRoom.seat_key(first_row_name, screening_room.seat_index(first_row_name, first_unnil_seat_index))

        # todo: add js test when choosing seats
        status_types = ScreeningRoom.status_types
        td_row_unnil_seats.each do |td|
          seat_key = td[:id] 
          ori_status = movie_session.seat_status[seat_key] || screening_room.seat_statuses[seat_key]
          td.click
          case ori_status
          when status_types[:single_available]
            td[:class].should be_include("seat_taken")
          when status_types[:double_available]
            td[:class].should be_include("seat_taken")
          when status_types[:not_available]
            td[:class].should be_include("seat_not_available")
          when status_types[:taken]
            td[:class].should be_include(td[:ori_class])
          end
        end
      end
    end

    context "Session order", :js => true do
      let!(:movie) { movie_session.movie }
      let!(:session_order) { FactoryGirl.create(:session_order) }
      before do
        # binding.pry
        td_row_unnil_seats = first("tr").all("td").to_a.keep_if { |td| td[:class] == "seat_single_available" || td[:class] == "seat_double_available" }
        @td_first_seat = td_row_unnil_seats.first
        @td_second_seat = td_row_unnil_seats.at(1)
      end

      it "should add ticket to session order" do
        @td_first_seat.click

        find("#info_choosed_seats").text.should be_include(@td_first_seat[:title])
        find("#info_tickets_num").text.should be_include("1") 
        find("#info_expense").text.should be_include(movie_session.price.to_s)

        click_on "提交订单"

        current_path.should == session_order_path(SessionOrder.last.id)
      end

    end

  end
end