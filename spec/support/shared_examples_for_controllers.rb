require 'set'

shared_examples "a JSONish controller" do |subject_name|
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user    
  end
  
  describe "members" do
    let!(:subject) { FactoryGirl.create(subject_name.to_sym) }
    
    before(:each) do
      described_class_model.stub!(:find).and_return(subject)
      @attr = FactoryGirl.attributes_for(subject_name.to_sym).merge({:type => described_class_model.to_s})
    end

    describe "GET 'show'" do
      it "finds the right #{subject_name}" do
        get :show, id:subject.id
        assigns(subject_name.to_sym).should == subject  
      end
    end

    describe "POST 'create'" do

      it "creates a #{subject_name}" do
        expect{
          post :create, subject_name.to_sym => @attr, :format => :json
        }.to change(described_class_model,:count).by(1)
      end

      it "returns a JSON #{subject_name}" do
        post :create, subject_name.to_sym => @attr, :format => :json
        @attr.each do |attribute, value|
          response.body.should =~ /#{value}/ unless attribute == :type
        end
      end  

    end
            
  end

  describe "collection" do
    describe "GET 'index'" do
      let!(:collection) {3.times.map { FactoryGirl.create(subject_name.to_sym) } }

      it "returns all of the #{subject_name.pluralize}" do
        get :index, :type => described_class_model.to_s
        assigns(subject_name.pluralize.to_sym).should == collection 
      end

    end    
  end
  
end

shared_examples "an owned object" do |subject_name|
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user    
    @attr = FactoryGirl.attributes_for(subject_name.to_sym).merge({:type => described_class_model.to_s})
  end  

  describe "POST 'create'" do

    it "assigns the user as creator of the #{subject_name}" do
      post :create, subject_name.to_sym => @attr, :format => :json
      described_class_model.last.creator.should == @user
    end
  end
end