class Round < ActiveRecord::Base
  validates_presence_of :name
  has_many :quiz_rounds
  has_many :quizzes, :through => :quiz_rounds
  has_many :round_questions

end
