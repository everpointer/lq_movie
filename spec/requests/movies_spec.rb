# encoding: utf-8
require 'spec_helper'

describe "Movies" do
  describe "GET /movies/:id" do
    let!(:movie) { FactoryGirl.create(:movie) }
    before { visit movie_path(movie) }

    it "should view a movie" do
      movie.attributes.each do |attribute|
        page.should have_content(attribute[0])
        page.should have_content(attribute[1])
      end
    end
  end
end
