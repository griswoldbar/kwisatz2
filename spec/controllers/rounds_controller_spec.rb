require 'spec_helper'

describe RoundsController do
  it_behaves_like "a JSONish controller", "round" do
    let(:described_class_model) { Round::Base }
  end

  it_behaves_like "an owned object", "round" do
    let(:described_class_model) { Round::Base }
  end
end