class Round::Jeopardy < Round::Base
  self.question_types = self.superclass.question_types + [Question::Jeopardy]
end