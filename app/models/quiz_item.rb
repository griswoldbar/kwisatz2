class QuizItem < KwisatzObject
  belongs_to :quiz, :class_name => "Quiz::Base"
    
end
