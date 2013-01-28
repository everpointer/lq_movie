# encoding: utf-8
require 'spec_helper'

describe "Movies" do
  describe "GET /movies/:id" do
    let!(:movie) { FactoryGirl.create(:movie) }

    before { visit movie_path(movie) }

    it "should view a movie" do
      movie.attributes.each do |attribute|
        if attribute[1].instance_of?(Array)
          page.should have_content(movie.join(attribute[0]))
        end
      end
    end

    describe "Movie sessions" do
      let!(:movie_session) { FactoryGirl.create(:movie_session, movie: movie) }
      let!(:screening_room) { movie_session.screening_room }
      let!(:movie_theatre) { movie_session.movie_theatre }
      let!(:other_theatre) { FactoryGirl.create(:movie_theatre, name: "宁波民光影城") }
      subject { page }

      context "with right filters" do
        before do
          right_date = movie_session.on_date.to_s
          find("[date='#{right_date}']").click
          click_link movie_theatre.area
          click_link movie_theatre.name
        end

        it "should view a session" do
          page.should have_content screening_room.name
          page.should have_content movie_session.on_time

          click_link movie_session.on_time
          current_path.should == movie_session_path(movie_session)
        end
      end

      context "with wrong filters" do
        before do
          wrong_date = movie_session.on_date.next_day.to_s
          find("[date='#{wrong_date}']").click
          page.should have_content(other_theatre.area)
          click_link other_theatre.area
          page.should have_content(other_theatre.name)
          click_link other_theatre.name
        end

        it "should not view a session" do
          page.should_not have_content screening_room.name
        end
      end
    end
  end

end