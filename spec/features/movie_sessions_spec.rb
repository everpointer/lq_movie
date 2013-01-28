# encoding: utf-8
require 'spec_helper'

describe "Movie Sessions" do
  describe "GET /movie_sessions/:id" do
    let!(:movie_session) { FactoryGirl.create(:movie_session) }

    before do
      visit movie_session_path(movie_session)
    end

    it "should view a movie session" do
      page.should have_content movie_session.screening_room.name
      page.should have_css("tr")
    end

  end
end