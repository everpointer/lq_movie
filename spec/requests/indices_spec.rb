# encoding: utf-8
require 'spec_helper'

describe "Indices" do
  describe "visits page" do
    it "should view screening movie list" do
      visit root_path

      page.should have_content("电影名称")
      page.should have_content("选座购票")
    end

  end
end
