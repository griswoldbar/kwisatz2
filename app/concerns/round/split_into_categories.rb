module Round::SplitIntoCategories
  extend ActiveSupport::Concern
  
  included do
    serialized_attr_accessor :number_of_categories, :questions_per_category
    validates :number_of_categories,   presence:true, numericality:true
    validates :questions_per_category, presence:true, numericality:true
    
    before_create :build_round_questions
    
  end
  
  module ClassMethods
  
  end
  
  
  private
  def build_round_questions
    number_of_categories.to_i.times do |x|
      questions_per_category.to_i.times do |y|
        self.round_questions << RoundQuestion::GridSlot.new(x:x+1, y:y+1)        
      end
    end
  end
  
  
end