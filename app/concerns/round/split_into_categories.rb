module Round::SplitIntoCategories
  extend ActiveSupport::Concern
  
  included do
    serialized_attr_accessor :number_of_categories, :questions_per_category
    validates :number_of_categories,   presence:true, numericality:true
    validates :questions_per_category, presence:true, numericality:true
  end
  
  module ClassMethods
  
  end
  
  #list instance methods here
  
end