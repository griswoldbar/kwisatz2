require 'spec_helper'

describe QuizItem do
  let(:quiz_item) {subject}
  
  it "belongs to a quiz" do
    quiz = FactoryGirl.create(:quiz)
    quiz.quiz_items << quiz_item
    quiz_item.quiz.should == quiz
    expect { quiz_item.save! }.not_to raise_error
  end

  it "contains serialized data" do
    quiz_item.data = "blah"
    expect {
      quiz_item.save
    }.to raise_error(ActiveRecord::SerializationTypeMismatch)
    quiz_item.data = {:something => "blah"}
    quiz_item.should be_valid  
  end
  
end