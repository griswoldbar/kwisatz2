require 'spec_helper'

describe RoundsController do
  it_behaves_like "a JSONish controller", "round" do
    let(:described_class_model) { Round::Base }
  end

  it_behaves_like "an owned object", "round" do
    let(:described_class_model) { Round::Base }
  end
  
  # describe "GET 'show'" do
  #   
  #   before(:each) do
  #     @user = FactoryGirl.create(:user)
  #     sign_in @user
  #     @round = FactoryGirl.create(:round_simple_with_questions)
  #   end
  # 
  #   it "returns associated round_questions" do
  #     get :show, id:@round.id
  #     throw JSON.parse(response.body)
  #   end      
  # 
  # end
  
end