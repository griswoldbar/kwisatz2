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
  
  
  it "stores data as a serialized hash" do
    question.data = "blah"
    expect {
      question.save
    }.to raise_error(ActiveRecord::SerializationTypeMismatch)
    question.data = {:thingy => "blah"}
    question.should be_valid
  end
  
  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    user.questions << question
    question.user.should == user
  end



    
end