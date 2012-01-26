module Question::Solution
  extend ActiveSupport::Concern
  
  included do
    serialized_attr_accessor :solution
    validates :solution, :presence => true
  end

end