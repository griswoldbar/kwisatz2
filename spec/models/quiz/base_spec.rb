require 'spec_helper'

describe "Quiz::Base" do
  let(:quiz) {FactoryGirl.build(:quiz)}
  it "requires a name" do
    quiz = Quiz::Base.new
    quiz.should_not be_valid
    quiz.name = "My Fab Quiz"
    quiz.should be_valid
  end
  
  it "has many rounds" do
    rounds = [FactoryGirl.build(:round), FactoryGirl.build(:round)]
    quiz.rounds << [rounds]
    quiz.rounds.should include(rounds[0])
    quiz.rounds.should include(rounds[1])
    expect { quiz.save! }.not_to raise_error
  end
  
  it "belongs to many rounds" do
    round1 = FactoryGirl.build(:round)
    round2 = FactoryGirl.build(:round)
    round1.quizzes << quiz
    round2.quizzes << quiz
    round1.quizzes.should include(quiz)
    round2.quizzes.should include(quiz)
    expect { round1.save! }.not_to raise_error
    expect { round2.save! }.not_to raise_error
  end
  
  it "has many quiz_items" do
    quiz_items = [QuizItem.new, QuizItem.new]
    quiz.quiz_items << quiz_items
    quiz.quiz_items.should include(quiz_items[0])
    quiz.quiz_items.should include(quiz_items[1])
    expect { quiz.save! }.not_to raise_error
  end

  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    user.quizzes << quiz
    quiz.user.should == user
  end
    
end