FactoryGirl.define do
  factory :round, :class => "Round::Base" do
    sequence(:name) { |n| "Round #{n}" }
  end
  
  factory :jeopardy, :parent => :round, :class => "Round::Jeopardy" do
    
  end
  
end