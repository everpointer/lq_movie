# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie_session do
    seat_status Hash.new
    movie_edition "数字 原声"
    price 48
    screening_date DateTime.new(Date.today.year, Date.today.month, Date.today.day, 8, 40)

    association :movie
    association :movie_theatre
    association :screening_room
  end
end
