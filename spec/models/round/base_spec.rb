require 'spec_helper'

describe Round::Base do
  let(:round) { FactoryGirl.build(:round)}
  it "requires a name" do
    round = Round::Base.new
    round.should_not be_valid
    round.name = "My Fab Round"
    round.should be_valid
  end
  
  describe "Quiz association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "quiz" }
    end
    
    it_behaves_like "it has multiple parent objects" do
      let(:parent_name) {"quiz"}  
    end
  end
  
  describe "Question association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "question" }
    end
    
    it_behaves_like "it has multiple parent objects" do
      let(:parent_name) {"question"}  
    end  
  end
  
  describe "Round_item association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "round_item" }
    end    
  end
  
  describe "User association" do
    it_behaves_like "it has a parent object" do
      let(:parent_name) {"creator"}
      let(:factory_name) {"user"}
    end
  end
  
  it "stores rounds as the correct class" do
    quiz = FactoryGirl.build(:quiz)
    blockbuster = FactoryGirl.build(:round, :type => "Round::Blockbuster")
    quiz.rounds << blockbuster
    quiz.save
    quiz.reload
    quiz.rounds.first.should be_a(Round::Blockbuster)
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
    
    it "accepts empty round questions" do
      fakeround = Round::FakeRound.new(FactoryGirl.attributes_for(:round))
      fakeround.round_questions << RoundQuestion::Base.new(FactoryGirl.attributes_for(:round_question))
      expect {
        fakeround.save!
      }.not_to raise_error    
    end

  end

  
end