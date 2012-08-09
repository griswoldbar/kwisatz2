class Quiz::Base < KwisatzObject
  include Categorisable
  include Authorable
  
  attr_accessor :round_count
  class_attribute :quiz_types
  class_attribute :round_types
  
  self.table_name = :quizzes
  self.quiz_types = [
                      ['Simple',Quiz::Simple]
                    ]
  
  validates :name, presence:true
  has_many :rounds, :through => :quiz_rounds, :class_name => "Round::Base"
  has_many :quiz_rounds, :foreign_key => :quiz_id
  has_many :quiz_items, :foreign_key => :quiz_id
  
  def round_count=(val)
    @round_count = val.to_i
  end
  
  def possible_rounds
    Round::Base.all
  end
  
end