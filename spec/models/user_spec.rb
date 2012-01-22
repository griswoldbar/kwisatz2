require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.build(:user)}
  
  
  describe "Quiz association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "quiz" }
    end
  end
  
  describe "Round association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "round" }
    end
  end
  
  describe "Question association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "question" }
    end
  end

end