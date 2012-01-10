fake_data = {:problem => "Who shot JFK?", :solution => "Lee Harvey Oswald"}
FactoryGirl.define do
  factory :question, :class => "Question::Base" do
    data fake_data
  end
  
  factory :basic_question, :class => "Question::Basic" do
    problem "Who shot JFK?"
    solution "Lee Harvey Oswald"
  end
end