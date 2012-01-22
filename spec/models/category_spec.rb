require 'spec_helper'

describe Category do
  let (:category) {FactoryGirl.build(:category)}

  it "is valid given valid attributes" do
    category.should be_valid
  end
  
  it "requires a name" do
    category.name = nil
    category.should_not be_valid
  end
  
  
  it "belongs to a parent category" do
    parent_category = FactoryGirl.create(:category)
    parent_category.sub_categories << category
    category.parent_category.should == parent_category
  end
  
  describe "Subcategory association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "sub_category" }
      let(:factory_name) {"category"}
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
  
  describe "Quiz association" do
    it_behaves_like "it has a collection" do
      let(:child_name) { "quiz" } 
    end  
  end
  
end