# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :screening_room do
    name "2号厅"
    seats "A" => [0,1,1,404,2,2,0],
          "B" => [1,1,1,1,1,1,1],
          "C" => [2,2,2,2,2,2,2]
    order "RL"
  end
end
