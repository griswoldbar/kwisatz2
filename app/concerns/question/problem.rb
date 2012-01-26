module Question::Problem
  extend ActiveSupport::Concern
  
  included do
    serialized_attr_accessor :problem
    validates :problem, :presence => true
  end

end