class Round::Jeopardy < Round::Base
  @question_types = self.superclass.question_types + [Question::Jeopardy]
  @use_custom_data_type = true
end