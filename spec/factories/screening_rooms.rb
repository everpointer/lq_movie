# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :screening_room do
    name "2号厅"
    seats "A" => [nil,0,2,3,nil],
          "B" => [0,0,0,0,0],
          "C" => [0,0,0,0,0]
    order "RL"
  end
end
