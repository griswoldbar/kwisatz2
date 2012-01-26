require 'set'

shared_examples "it is split into categories" do |factory|
  
  it_behaves_like "it requires the attribute", :questions_per_category, factory
  
  it_behaves_like "it requires the attribute", :number_of_categories, factory

  it_behaves_like "it validates the numericality of the attribute", :questions_per_category, factory
  
  it_behaves_like "it validates the numericality of the attribute", :number_of_categories, factory
  
end