require 'spec_helper'

describe RoundItem do
  let(:round_item) {subject}
  
  it "belongs to a round" do
    round = FactoryGirl.create(:round)
    round.round_items << round_item
    round.save!
    round_item.round.should == round
  end

  it "contains serialized data" do
    round_item.data = "blah"
    expect {
      round_item.save
    }.to raise_error(ActiveRecord::SerializationTypeMismatch)
    round_item.data = {:something => "blah"}
    round_item.should be_valid  
  end
end