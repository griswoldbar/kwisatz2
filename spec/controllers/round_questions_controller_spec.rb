require 'spec_helper'

describe RoundQuestionsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user    
  end
  
  describe "PUT 'update'" do
  
    context "when a question_id is posted" do
      it "sets the question as its own" do
        pending
      end
    end
    

  end

end