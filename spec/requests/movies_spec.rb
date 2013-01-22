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
  end
end
