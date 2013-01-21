# encoding: utf-8
require 'spec_helper'

describe "Indices" do
  describe "visits page" do
    let!(:movie) { FactoryGirl.create(:movie) }

    it "should view screening movie list" do
      visit root_path

      page.should have_content(movie.title)
      page.should have_content(movie.image)
      page.should have_content("选座购票")
    end

  end
end
