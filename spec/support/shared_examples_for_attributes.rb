require 'set'

shared_examples "it requires the attribute" do |attribute, factory|
  let(:subject) {FactoryGirl.build(factory)}
  it "#{attribute}" do
    subject.should be_valid
    subject.send("#{attribute}=",nil)
    subject.should_not be_valid
  end
  
end

shared_examples "it validates the numericality of the attribute" do |attribute, factory|
  let(:subject) {FactoryGirl.build(factory)}
  it "#{attribute}" do
    subject.should be_valid
    subject.send("#{attribute}=","hai")
    subject.should_not be_valid
  end
  
end