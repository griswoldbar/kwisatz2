require 'spec_helper'

describe QuizItem do
  let(:quiz_item) {subject}

  
  describe "Quiz association" do
    it_behaves_like "it has a parent object" do
      let(:parent_name) {"quiz"}
    end
  end
  
end