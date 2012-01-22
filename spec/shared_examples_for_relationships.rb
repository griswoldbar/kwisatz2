shared_examples "it has a collection" do
  let(:subject_name) {described_class.to_s.downcase.to_sym}
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