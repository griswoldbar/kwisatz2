require 'spec_helper'

describe Round::Base do
  let(:round) {subject}
  it "requires a name" do
    round.should_not be_valid
    round.name = "My Fab Round"
    round.should be_valid
  end
  
  it "has many quizzes" do
    quizzes = [Quiz.new, Quiz.new]
    round.quizzes << [quizzes]
    round.quizzes.should include(quizzes[0])
    round.quizzes.should include(quizzes[1])
  end
  
  it "belongs to many quizzes" do
    quiz1 = Quiz.new
    quiz2 = Quiz.new
    quiz1.rounds << round
    quiz2.rounds << round
    quiz2.rounds.should include(round)
    quiz2.rounds.should include(round)
  end
  
  it "has many questions" do
    questions = [Question::Base.new, Question::Base.new]
    round.questions << [questions]
    round.questions.should include(questions[0])
    round.questions.should include(questions[1])
  end
  
  it "belongs to many questions" do
    question1 = Question::Base.new
    question2 = Question::Base.new
    question1.rounds << round
    question2.rounds << round
    question2.rounds.should include(round)
    question2.rounds.should include(round)  
  end
  
  it "has many round_items" do
    round_items = [RoundItem.new, RoundItem.new]
    round.round_items << round_items
    round.round_items.should include(round_items[0])
    round.round_items.should include(round_items[1])
  end
  
  it "stores rounds as the correct class" do
    quiz = FactoryGirl.create(:quiz)
    blockbuster = Factory(:round, :type => "Round::Blockbuster")
    quiz.rounds << blockbuster
    quiz.save
    quiz.reload
    quiz.rounds.first.should be_a(Round::Blockbuster)
  end

  it "only accepts questions of the right class" do
    class SuitableQuestion < Question::Base; end
    class OtherSuitableQuestion < Question::Base; end
    class UnsuitableQuestion < Question::Base;end
    class FakeRound < Round::Base
      @question_types = [SuitableQuestion, OtherSuitableQuestion]
    end
    
    fakeround = FakeRound.new(FactoryGirl.attributes_for(:round))
    fakeround.questions << UnsuitableQuestion.new(FactoryGirl.attributes_for(:question))
    expect {
      fakeround.save!
    }.to raise_error(Round::BadQuestionType)

    fakeround = FakeRound.new(FactoryGirl.attributes_for(:round))
    fakeround.questions << SuitableQuestion.new(FactoryGirl.attributes_for(:question))    
    fakeround.questions << OtherSuitableQuestion.new(FactoryGirl.attributes_for(:question))    
    expect {
      fakeround.save!
    }.not_to raise_error
  end
  

  
end