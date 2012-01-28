FactoryGirl.define do
  factory :round, :class => "Round::Base" do
    type "Round::Base"
    sequence(:name) { |n| "Round #{n}" }
  end
  
  factory :round_simple, :parent => :round, :class => "Round::Simple" do
    type "Round::Simple"
  end
  
  factory :round_jeopardy, :parent => :round, :class => "Round::Jeopardy" do
    type "Round::Jeopardy"
    number_of_categories "3"
    questions_per_category "4"
  end
  
end