# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie_session do
    movie_edition "数字 原声"
    price 48
    screening_date "2013-01-23 14:50:06"

    association :movie
    association :movie_theatre
    association :screening_room
  end
end
