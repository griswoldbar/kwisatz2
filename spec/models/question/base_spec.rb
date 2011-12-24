require 'spec_helper'

describe Question::Base do
  let(:question) { FactoryGirl.build(:question) }

  it "belongs to many rounds" do
    round1 = FactoryGirl.build(:round)
    round2 = FactoryGirl.build(:round)
    round1.questions << question
    round2.questions << question
    round1.questions.should include(question)
    round2.questions.should include(question)
    expect { round1.save! }.not_to raise_error
    expect { round2.save! }.not_to raise_error
  end
  
  it "has many rounds" do
    rounds = [FactoryGirl.build(:round),FactoryGirl.build(:round)]
    question.rounds << rounds
    question.rounds.should include(rounds[0])
    question.rounds.should include(rounds[1])
    expect { question.save! }.not_to raise_error
  end
  
  it "needs a value in the data column" do
    question.data = nil
    question.should_not be_valid
  end
  
  it "stores data as a serialized question_data object" do
    question.data = "blah"
    expect {
      question.save
    }.to raise_error(ActiveRecord::SerializationTypeMismatch)
    question.data = QuestionData::Base.new
    question.should be_valid
  end

  it "accepts a problem parameter which writes to the data hash" do
    question.problem = "Who shot JFK?"
    question.data.problem.should == "Who shot JFK?"
    question.problem.should == "Who shot JFK?"
  end

  it "accepts a solution parameter which writes to the data hash" do
    question.solution = "Lee Harvey Oswald"
    question.data.solution.should == "Lee Harvey Oswald"    
    question.solution.should == "Lee Harvey Oswald"    
  end

    
end