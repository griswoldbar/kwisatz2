class Round::Jeopardy < Round::Base
  include Round::SplitIntoCategories
  
  self.question_types = [Question::Simple]


end