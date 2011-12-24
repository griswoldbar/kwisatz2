class QuestionData::Base

  attr_accessor :problem,:solution,:categories
  
  def initialize
    @categories = []
  end
  
end