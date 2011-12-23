FactoryGirl.define do
  factory :round, :class => "Round::Base" do
    sequence(:name) { |n| "Round #{n}" }
  end
  
end