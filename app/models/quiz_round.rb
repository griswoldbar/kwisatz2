class QuizRound < ActiveRecord::Base
  belongs_to :round
  belongs_to :quiz
end
