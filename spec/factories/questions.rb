fake_data = QuestionData::Base.new

FactoryGirl.define do
  factory :question, :class => "Question::Base" do
    data fake_data
  end
end