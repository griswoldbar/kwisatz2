class Question::Base < KwisatzObject
  
  set_table_name :questions
  
  has_many :rounds, :through => :round_questions, :class_name => "Round::Base", :foreign_key => :round_id
  has_many :round_questions, :foreign_key => :question_id
  serialize :data, QuestionData::Base
  
  validates_presence_of :data
    
  def problem=(problem_data)
    self.data.problem = problem_data
  end
  
  def problem
    self.data.problem
  end
  
  def solution=(solution_data)
    self.data.solution = solution_data
  end
  
  def solution
    self.data.solution
  end

end