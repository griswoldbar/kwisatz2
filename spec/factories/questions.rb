fake_data = {:text => "Why did the chicken cross the road?"}

FactoryGirl.define do
  factory :question, :class => "Question::Base" do
    data fake_data
  end
end