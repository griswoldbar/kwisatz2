require 'spec_helper'

describe Question::Base do
  let(:question) { FactoryGirl.build(:question) }
  
  describe "Round association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "round" }
      let(:factory_name) {"round"}
    end
    
    it_behaves_like "it has multiple parent objects" do
      let(:parent_name) {"round"}
    end
  end  
  
  describe "Category association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "category" }
    end
  end
  
  describe "User association" do
    it_behaves_like "it has a parent object" do
      let(:parent_name) {"creator"}
      let(:factory_name) {"user"}
    end
  
  end
  



    
end