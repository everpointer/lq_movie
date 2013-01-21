# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "电影名称"
    image "图片连接"
    author "导演"
    cast   "主演"
    movie_type "类型"
    pubdate "2013-01-23"
    country "地区"
    language "语言"
    movie_duration "片长"
    movie_edition "版本"
    rating 8.8
    summary "简介"
  end
end
