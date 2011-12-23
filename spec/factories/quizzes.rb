FactoryGirl.define do
  factory :quiz do
    sequence(:name) { |n| "Quiz #{n}" }
  end
  
end