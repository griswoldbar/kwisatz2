class QuizItem < KwisatzObject
  self.table_name = :quiz_items
  
  belongs_to :quiz, :class_name => "Quiz::Base"
    
end
