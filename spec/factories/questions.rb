FactoryGirl.define do
  factory :question, :class => "Question::Base" do
    type "Question::Base"
  end
  
  factory :basic_question, :class => "Question::Basic" do
    type "Question::Basic"
    problem "Who shot JFK?"
    solution "Lee Harvey Oswald"
  end
end