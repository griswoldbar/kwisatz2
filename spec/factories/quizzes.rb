FactoryGirl.define do
  factory :quiz, :class => "Quiz::Base" do
    sequence(:name) { |n| "Quiz #{n}" }
  end
  
end