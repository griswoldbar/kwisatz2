require 'spec_helper'

describe Question::Base do
  let(:question) { subject }

  it "belongs to many rounds" do
    round1 = Round::Base.new
    round2 = Round::Base.new
    round1.questions << question
    round2.questions << question
    round1.questions.should include(question)
    round2.questions.should include(question)
  end
  
  it "has many rounds" do
    rounds = [Round::Base.new,Round::Base.new]
    question.rounds << rounds
    question.rounds.should include(rounds[0])
    question.rounds.should include(rounds[1])
  end
  
  it "needs a value in the data column" do
    question.data = nil
    question.should_not be_valid
  end
  
  it "stores data as a serialized hash" do
    question.data = "blah"
    expect {
      question.save
    }.to raise_error(ActiveRecord::SerializationTypeMismatch)
    question.data = {:something => "blah"}
    question.should be_valid
  end
  
end