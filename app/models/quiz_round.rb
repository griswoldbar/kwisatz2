class QuizRound < ActiveRecord::Base
  belongs_to :round, :class_name => "Round::Base"
  belongs_to :quiz
end
