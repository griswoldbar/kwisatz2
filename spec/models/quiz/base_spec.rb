require 'spec_helper'

describe Quiz::Base do
  let(:quiz) {FactoryGirl.build(:quiz)}
  it "requires a name" do
    quiz = Quiz::Base.new
    quiz.should_not be_valid
    quiz.name = "My Fab Quiz"
    quiz.should be_valid
  end
  
  describe "Round association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "round" }
      let(:factory_name) {"round"}
    end  

    it_behaves_like "it has multiple parent objects" do
      let(:parent_name) {"round"}
    end  
  end

  describe "User association" do
    it_behaves_like "it has a parent object" do
      let(:parent_name) {"creator"}
      let(:factory_name) {"user"}
    end
  end
    
end