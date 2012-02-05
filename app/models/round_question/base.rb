class RoundQuestion::Base < KwisatzObject
  
  self.table_name = :round_questions
  
  belongs_to :question, :class_name => "Question::Base"
  belongs_to :round, :class_name => "Round::Base", :foreign_key => :round_id
  
  validate :question_of_right_type
  
  
  private
  
  def question_of_right_type
    if self.question.present?
      white_list = self.round.class.question_types
      question_class = self.question.class
      if white_list.include?(question_class)
        true
      else
        raise Round::BadQuestionType
      end
    end
  end
  
end