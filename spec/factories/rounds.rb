FactoryGirl.define do
  factory :round do
    sequence(:name) { |n| "Round #{n}" }
  end
  
end