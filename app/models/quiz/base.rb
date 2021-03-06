class Quiz::Base < KwisatzObject
  set_table_name :quizzes
  serialize :data, QuizData::Base
  
  validates_presence_of :name
  has_many :rounds, :through => :quiz_rounds, :class_name => "Round::Base"
  has_many :quiz_rounds, :foreign_key => :quiz_id
  has_many :quiz_items, :foreign_key => :quiz_id
end