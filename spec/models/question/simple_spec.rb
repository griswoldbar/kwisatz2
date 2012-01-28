require 'spec_helper'

describe "Question::Simple" do
  let(:question) {Question::Simple.new}
  it "accepts a problem parameter which writes to the data" do
    question.problem = "Who shot JFK?"
    question.data[:problem].should == "Who shot JFK?"
    question.problem.should == "Who shot JFK?"
  end

  it "accepts a solution parameter which writes to the data" do
    question.solution = "Lee Harvey Oswald"
    question.data[:solution].should == "Lee Harvey Oswald"    
    question.solution.should == "Lee Harvey Oswald"    
  end

end