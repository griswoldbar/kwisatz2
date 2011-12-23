require 'spec_helper'

describe Quiz do
  let(:quiz) {subject}
  it "requires a name" do
    quiz.should_not be_valid
    quiz.name = "My Fab Quiz"
    quiz.should be_valid
  end
  
  it "has many rounds" do
    rounds = [Round.new, Round.new]
    quiz.rounds << [rounds]
    quiz.rounds.should include(rounds[0])
    quiz.rounds.should include(rounds[1])
  end
  
  it "belongs to many rounds" do
    round1 = Round.new
    round2 = Round.new
    round1.quizzes << quiz
    round2.quizzes << quiz
    round1.quizzes.should include(quiz)
    round2.quizzes.should include(quiz)
  end
  
end