class QuizRound < KwisatzObject
  include QuizRound::Ordered
  
  belongs_to :round, :class_name => "Round::Base"
  belongs_to :quiz, :class_name => "Quiz::Base"
end
