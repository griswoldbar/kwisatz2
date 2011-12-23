class Question::Base < ActiveRecord::Base
  set_table_name :questions
  
  has_many :rounds, :through => :round_questions, :class_name => "Round::Base"
  has_many :round_questions, :foreign_key => :question_id
  serialize :data, Hash
  validates_presence_of :data
end