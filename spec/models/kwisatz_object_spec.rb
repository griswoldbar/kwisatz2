require 'spec_helper'
require 'support/temping'
include Temping

describe "KwisatzObject" do
  describe "Data Object association" do
    before(:each) do
      module ThingyData;end
      class ThingyData::Base < KwisatzDataObject;end
      module Thingy;end
      Temping.create_model :base, :thingy, KwisatzObject do
        set_table_name :thingies
        attr_accessor :data
      end
    end
    
    context "when a custom object" do
      before(:each) do
        Temping.create_model :jeopardy, :thingy, Thingy::Base do
          @use_custom_data_type = true
        end     
        class ThingyData::Jeopardy < ThingyData::Base;end
      end
      
      it "has the right associated data object" do
        j = Thingy::Jeopardy.new
        j.data.should be_a(ThingyData::Jeopardy)
      end
      
    end

    context "when a custom object" do
      before(:each) do
        Temping.create_model :jeopardy, :thingy, Thingy::Base do
          @use_custom_data_type = false
        end     
        class ThingyData::Jeopardy < ThingyData::Base;end
      end
            
      it "has the right associated data object" do
        j = Thingy::Jeopardy.new
        j.data.should be_a(ThingyData::Base)  
      end
    end
  end

  ActiveRecord::Base.establish_connection 'test' 

end