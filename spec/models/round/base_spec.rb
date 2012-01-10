require 'spec_helper'

describe "Round::Base" do
  let(:round) { FactoryGirl.build(:round)}
  it "requires a name" do
    round = Round::Base.new
    round.should_not be_valid
    round.name = "My Fab Round"
    round.should be_valid
  end
  
  it "has many quizzes" do
    quizzes = [FactoryGirl.build(:quiz), FactoryGirl.build(:quiz)]
    round.quizzes << [quizzes]
    round.quizzes.should include(quizzes[0])
    round.quizzes.should include(quizzes[1])
    expect { round.save! }.not_to raise_error
  end
  
  it "belongs to many quizzes" do
    quiz1 = FactoryGirl.build(:quiz)
    quiz2 = FactoryGirl.build(:quiz)
    quiz1.rounds << round
    quiz2.rounds << round
    quiz2.rounds.should include(round)
    quiz2.rounds.should include(round)
    expect { quiz1.save! }.not_to raise_error
  end
  
  it "has many questions" do
    questions = [FactoryGirl.build(:question), FactoryGirl.build(:question)]
    round.questions << [questions]
    round.questions.should include(questions[0])
    round.questions.should include(questions[1])
    expect { round.save! }.not_to raise_error
  end
  
  it "belongs to many questions" do
    question1 = FactoryGirl.build(:question)
    question2 = FactoryGirl.build(:question)
    question1.rounds << round
    question2.rounds << round
    question2.rounds.should include(round)
    question2.rounds.should include(round)  
    expect { question1.save! }.not_to raise_error
    expect { question2.save! }.not_to raise_error
  end
  
  it "has many round_items" do
    round_items = [RoundItem.new, RoundItem.new]
    round.round_items << round_items
    round.round_items.should include(round_items[0])
    round.round_items.should include(round_items[1])
    expect { round.save! }.not_to raise_error
  end
  
  it "stores rounds as the correct class" do
    quiz = FactoryGirl.build(:quiz)
    blockbuster = FactoryGirl.build(:round, :type => "Round::Blockbuster")
    quiz.rounds << blockbuster
    quiz.save
    quiz.reload
    quiz.rounds.first.should be_a(Round::Blockbuster)
  end

  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    user.rounds << round
    round.user.should == user
  end
  
  describe "question types" do
    before(:all) do

      class Question::SuitableQuestion < Question::Base; end
      class Question::OtherSuitableQuestion < Question::Base; end
      class Question::UnsuitableQuestion < Question::Base;end
      class Round::FakeRound < Round::Base
        self.question_types = [Question::SuitableQuestion, Question::OtherSuitableQuestion]
      end      
    end
    
    it "rejects questions of the wrong class" do
      fakeround = Round::FakeRound.new(FactoryGirl.attributes_for(:round))
      fakeround.questions << Question::UnsuitableQuestion.new(FactoryGirl.attributes_for(:question))
      expect {
        fakeround.save!
      }.to raise_error(Round::BadQuestionType)
    end
    
    it "accepts questions of the right class" do
      fakeround = Round::FakeRound.new(FactoryGirl.attributes_for(:round))
      fakeround.questions << Question::SuitableQuestion.new(FactoryGirl.attributes_for(:question))    
      fakeround.questions << Question::OtherSuitableQuestion.new(FactoryGirl.attributes_for(:question))    
      expect {
        fakeround.save!
      }.not_to raise_error      
    end

  end

  
end