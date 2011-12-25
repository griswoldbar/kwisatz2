require 'spec_helper'

describe "KwisatzObject" do

  describe "Data Object association" do
    before(:each) do
      module Thingy; end
      module ThingyData; end
      class Thingy::Base < KwisatzObject; end
      class Thingy::Jeopardy < Thingy::Base; end
      class ThingyData::Base; end
    end
    
    context "when a custom object" do
      before(:each) do
        class Thingy::Jeopardy < Thingy::Base
          @use_custom_data_type = true
        end
        class ThingyData::Jeopardy;end
        
      end
      
      it "has the right associated data object" do
        j = Thingy::Jeopardy.new
        j.data.should be_a(ThingyData::Jeopardy)
      end
      
    end

    context "when a custom object" do
      it "has the right associated data object" do
  
      end
    end
  end

end