require 'spec_helper'

describe QuizzesController do
  it_behaves_like "a JSONish controller", "quiz" do
    let(:described_class_model) { Quiz::Base }
  end

  it_behaves_like "an owned object", "quiz" do
    let(:described_class_model) { Quiz::Base }
  end
  
end