FactoryGirl.define do
  factory :round, :class => "Round::Base" do
    type "Round::Base"
    sequence(:name) { |n| "Round #{n}" }
  end
  
  factory :round_simple, :parent => :round, :class => "Round::Simple" do
    type "Round::Simple"
  end
  
  factory :round_simple_with_questions, :parent => :round_simple, :class => "Round::Simple" do
    
    after_create do |f|
      3.times do
        f.questions << FactoryGirl.create(:question_simple)
      end
    end
    
  end
  
  factory :round_jeopardy, :parent => :round, :class => "Round::Jeopardy" do
    type "Round::Jeopardy"
    number_of_categories "3"
    questions_per_category "4"
  end
  
end