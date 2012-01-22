require 'spec_helper'

describe Player do
  let(:player) {FactoryGirl.build(:player)}
  
  it "requires a name" do
    player.name = nil
    player.should_not be_valid
    player.name = "Jimmy"
    player.should be_valid
  end
  
  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    player.user = user
    player.save!
    player.user_id.should == user.id
  end
  
  it "requires a user" do
    player.user = nil
    player.should_not be_valid
  end
  
  
  
end