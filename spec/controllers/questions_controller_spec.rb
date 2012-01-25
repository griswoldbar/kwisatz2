require 'spec_helper'

describe QuestionsController do
  it_behaves_like "a JSONish controller", "question" do
    let(:described_class_model) { Question::Base }
  end

  it_behaves_like "an owned object", "question" do
    let(:described_class_model) { Question::Base }
  end
  
end