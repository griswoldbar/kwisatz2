class Round::Base < ActiveRecord::Base
  set_table_name :rounds
  
  validates_presence_of :name
  
  has_many :quiz_rounds, :foreign_key => :round_id
  has_many :quizzes, :through => :quiz_rounds
  has_many :round_questions, :foreign_key => :round_id
  has_many :questions, :through => :round_questions, :class_name => "Question::Base"
  has_many :round_items, :foreign_key => :round_id
   
  class << self; attr_accessor :question_types; end
  @question_types = [Question::Base]


end
