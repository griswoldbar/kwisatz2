FactoryGirl.define do
  factory :question, :class => "Question::Base" do
    type "Question::Base"
  end
  
  factory :question_simple, :class => "Question::Simple" do
    type "Question::Simple"
    problem "Who shot JFK?"
    solution "Lee Harvey Oswald"
  end
  
  factory :question_multiple_choice, :class => "Question::MultipleChoice" do
    type "Question::MultipleChoice"
  end
end