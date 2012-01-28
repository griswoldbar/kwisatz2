require 'spec_helper'

describe "Round::Simple" do
  let(:round) { FactoryGirl.create(:round_simple) }
  it "accepts simple questions" do
    expect {
      round.questions << FactoryGirl.build(:question_simple)
    }.not_to raise_error
  end
  
  it "rejects other question types" do
    expect {
      round.questions << FactoryGirl.build(:question_multiple_choice)
    }.to raise_error(Round::BadQuestionType)
  end
  
end