require 'spec_helper'

describe "KwisatzDataObject" do
  it "generates accessor methods from the YAML config file" do
    YAML.should_receive(:load_file).and_return("Dance" => {"Base" => {:thingy => "String"}})
    module DanceData; end
    class DanceData::Base < KwisatzDataObject
      self.generate_accessor_methods
    end
    d = DanceData::Base.new
    d.should respond_to(:thingy)
    d.should respond_to(:thingy=)
  end
end