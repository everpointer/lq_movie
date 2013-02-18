# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session_order do
    choosed_seats ["A1"]
    expense 10
    status "MyString"
    mobile "MyString"

    association :movie_session
  end
end
