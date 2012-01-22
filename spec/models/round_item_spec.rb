require 'spec_helper'

describe RoundItem do
  let(:round_item) {subject}
  
  describe "User association" do
    it_behaves_like "it has a parent object" do
      let(:parent_name) {"round"}
    end
  end

end