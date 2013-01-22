# encoding: utf-8
require 'spec_helper'

describe "Indices" do
  describe "visits page" do

    context "with screening movies" do
      let!(:movie) { FactoryGirl.create(:screening_movie) }

      it "should view screening movie list" do
        visit root_path

        page.should have_content(movie.title)
        page.should have_content("选座购票")
      end

      it "should view an movie" do
        visit root_path

        click_link "选座购票"
        current_path.should == movie_path(movie)
      end
    end
  end
end
