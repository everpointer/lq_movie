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

    context "Movie sessions" do
      subject { page }

      it { should have_content movie_theatre.name }
      it { should have_content screening_room.name }
    end

  end
end
