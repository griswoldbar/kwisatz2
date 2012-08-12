require 'spec_helper'

describe ObjectCategory do
  let(:object_category) { subject }
  
  describe "attributes" do
    
    describe ":primary" do
      let(:object) { FactoryGirl.create(:round_simple) }
      let(:category1) { FactoryGirl.create(:category) }
      let(:category2) { FactoryGirl.create(:category) }
      
      it "allows only one primary category per object" do
        object.categories << [category1,category2]
                
        object.object_categories[0].primary = true
        object.object_categories[0].save!
        object.object_categories[0].should be_valid
        
        object.object_categories[1].primary = true
        object.object_categories[1].should_not be_valid
      end
    end
  end
end