# encoding: utf-8
require 'spec_helper'

describe "Movies" do
  describe "GET /movies/:id" do
    let!(:movie_session) { FactoryGirl.create(:movie_session) }
    let!(:movie) { movie_session.movie }
    let!(:movie_theatre) { movie_session.movie_theatre }
    let!(:screening_room) { movie_session.screening_room }

    before { visit movie_path(movie) }

    it "should view a movie" do
      movie.attributes.each do |attribute|
        if attribute[1].instance_of?(Array)
          page.should have_content(movie.join(attribute[0]))
        end
      end
    end

    describe "Movie sessions" do
      subject { page }

      context "with right filters" do
        before do
          right_date = movie_session.on_date.to_s
          find("[date='#{right_date}']").click
          click_link movie_theatre.area
        end

        it "should view a session" do
          page.should have_content movie_theatre.name
          page.should have_content screening_room.name
        end
      end

      context "with wrong filters" do
        before do
          wrong_date = movie_session.on_date.next_day.to_s
          find("[date='#{wrong_date}']").click
          click_link FactoryGirl.build(:other_area_theater).area
        end

        it "should not view a session" do
          page.should_not have_content movie_theatre.name
          page.should_not have_content screening_room.name
        end

      end

    end

  end
end