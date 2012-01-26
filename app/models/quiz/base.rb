class Quiz::Base < KwisatzObject
  include Categorisable
  include Authorable
  
  set_table_name :quizzes
  
  validates :name, presence:true
  has_many :rounds, :through => :quiz_rounds, :class_name => "Round::Base"
  has_many :quiz_rounds, :foreign_key => :quiz_id
  has_many :quiz_items, :foreign_key => :quiz_id
  
  attr_accessor :round_count
end