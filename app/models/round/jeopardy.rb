class Round::Jeopardy < Round::Base
  @question_types = self.superclass.question_types + [Question::Jeopardy]
end