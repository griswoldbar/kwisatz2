class Round::Base < KwisatzObject
  include Categorisable
  include Authorable

  self.table_name = :rounds
  class_attribute :question_types
  
  has_many :round_questions, :foreign_key => :round_id
  has_many :questions, :through => :round_questions, :class_name => "Question::Base"
  has_many :round_items, :foreign_key => :round_id
  has_many :quiz_rounds, :foreign_key => :round_id
  has_many :quizzes, :through => :quiz_rounds, :class_name => "Quiz::Base"
  validates :name, presence:true
  
  self.question_types=[Question::Base] #prob best if these are strings
  
  def type_name
    self.type.split(/::/)[1]
  end
  
end