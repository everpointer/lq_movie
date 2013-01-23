# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :screening_room do
    name "2号厅"
    seats "MyText"
    order "RL"

    association :movie_theatre
  end
end
