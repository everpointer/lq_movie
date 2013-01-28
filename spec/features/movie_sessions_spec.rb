# encoding: utf-8
require 'spec_helper'

describe "Movie Sessions" do
  describe "GET /movie_sessions/:id" do
    let!(:movie_session) { FactoryGirl.create(:movie_session) }
    let!(:screening_room) { movie_session.screening_room }

    before do
      visit movie_session_path(movie_session)
    end

    it "should view a movie session" do
      page.should have_content movie_session.screening_room.name

      within "table>tbody" do
        all("tr").length.should == screening_room.row_nums
        first("tr").all("td").length.should == screening_room.column_nums

        d_seats = first("tr").all("td").to_a.delete_if { |td| td[:class] == "seat_none" }
        d_first_seat = d_seats.first
        # todo: 目前是静态复制，最好改成动态的
        first_row_name = screening_room.rowNames[0]
        first_unnil_seat_index = 1
        d_first_seat[:id].should == ScreeningRoom.seat_key(first_row_name, screening_room.seat_index(first_row_name, first_unnil_seat_index))
      end
    end

  end
end