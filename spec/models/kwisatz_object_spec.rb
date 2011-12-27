require 'spec_helper'
require 'support/temping'
include Temping

describe "KwisatzObject" do
  describe "Data Object association" do
    before(:each) do
      module DanceData;end
      class DanceData::Base < KwisatzDataObject;end
      module Dance;end
      Temping.create_model :base, :dance, KwisatzObject do
        set_table_name :dances
        attr_accessor :data
      end
      Temping.create_model :jeopardy, :dance, Dance::Base do;end     
      class DanceData::Jeopardy < DanceData::Base;end      
   
    end
    
    context "when a custom object" do
      before(:each) do
        class Dance::Jeopardy
          self.use_custom_data_type = true
        end     
      end
      
      it "has the right associated data object" do
        j = Dance::Jeopardy.new
        j.data.should be_a(DanceData::Jeopardy)
      end
      
    end

    context "when not a custom object" do
      before(:each) do
        class Dance::Jeopardy
          self.use_custom_data_type = false
        end     
      end
            
      it "has the right associated data object" do
        j = Dance::Jeopardy.new
        j.data.should be_a(DanceData::Base)  
      end
    end
  end
  
  # describe "data accessor methods" do
  # 
  #   it "has the right accessor methods" do
  #     YAML.should_receive(:load_file).and_return("Dance" => {"Base" => {:thingy => "String"}})
  #     module Dance; end
  #     Temping.create_model :base, :dance, KwisatzObject do
  #       set_table_name :dances
  #       attr_accessor :data
  #       self.generate_accessor_methods
  #     end
  #     
  #     d = Dance::Base.new
  #     
  #     # d.should respond_to(:thingy)
  #     # d.should respond_to(:thingy=)
  #   end
  #     
  # end

  ActiveRecord::Base.establish_connection 'test' 

end