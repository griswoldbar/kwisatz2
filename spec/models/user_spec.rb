require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.build(:user)}
  
  it "has many rounds" do
    rounds = [FactoryGirl.build(:round),FactoryGirl.build(:round)]
    user.rounds << rounds
    user.rounds.should include(rounds[0])
    user.rounds.should include(rounds[1])
    expect { user.save! }.not_to raise_error    
  end
  
  it "has many questions" do
    questions = [FactoryGirl.build(:question),FactoryGirl.build(:question)]
    user.questions << questions
    user.questions.should include(questions[0])
    user.questions.should include(questions[1])
    expect { user.save! }.not_to raise_error    
  end
  
  it "has many quizzes" do
    quizzes = [FactoryGirl.build(:quiz),FactoryGirl.build(:quiz)]
    user.quizzes << quizzes
    user.quizzes.should include(quizzes[0])
    user.quizzes.should include(quizzes[1])
    expect { user.save! }.not_to raise_error    
  end  
end