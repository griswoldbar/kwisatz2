shared_examples "it has a collection" do
  let(:subject_name) {described_class.to_s.split("::")[0].underscore.downcase.to_sym}
  let(:subject)    { FactoryGirl.build(subject_name) }
  let(:child)      { if defined? factory_name
                       FactoryGirl.build(factory_name.to_sym)
                     else
                       FactoryGirl.build(child_name.to_sym)
                     end}  
  let(:collection) { child_name.pluralize.to_sym}
  
  it "has many things" do
    children = [child,child]
    subject.send(collection) << children
    subject.send(collection).should include(children[0])
    subject.send(collection).should include(children[1])
    expect { subject.save!}.not_to raise_error    
  end

end

shared_examples "it has a parent object" do
  let(:subject_name) {described_class.to_s.split("::")[0].underscore.downcase}
  let(:subject)    { FactoryGirl.build(subject_name.to_sym) }
  let(:parent)     { if defined? factory_name
                       FactoryGirl.build(factory_name.to_sym)
                     else
                       FactoryGirl.build(parent_name.to_sym)
                     end}  
  let(:collection) { subject_name.pluralize.to_sym}

  it "belongs to something" do
    thing = parent
    thing.send(collection) << subject
    thing.save
    subject.send(parent_name.to_sym).should == thing
  end
end


shared_examples "it has multiple parent objects" do
  let(:subject_name) {described_class.to_s.split("::")[0].underscore.downcase}
  let(:subject)    { FactoryGirl.build(subject_name.to_sym) }
  let(:parent)     { if defined? factory_name
                       FactoryGirl.build(factory_name.to_sym)
                     else
                       FactoryGirl.build(parent_name.to_sym)
                     end}  
  let(:collection) { subject_name.pluralize.to_sym}  
  
  it "belongs to many things" do
    thing1 = parent
    thing2 = parent
    [thing1,thing2].each do |thing|
      thing.send(collection) << subject
      thing.send(collection).should include(subject)
      expect { thing.save! }.not_to raise_error
    end  
  end
end