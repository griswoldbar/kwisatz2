class Round::Jeopardy < Round::Base
  include Round::SplitIntoCategories
  
  self.question_types = self.superclass.question_types + [Question::Jeopardy]
end