class Question::Base < KwisatzObject
  include Categorisable
  include Authorable
  
  set_table_name :questions
    
  has_many :rounds, :through => :round_questions, :class_name => "Round::Base", :foreign_key => :round_id
  has_many :round_questions, :foreign_key => :question_id

end

