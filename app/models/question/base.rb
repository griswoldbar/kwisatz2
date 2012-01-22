class Question::Base < KwisatzObject

  set_table_name :questions
    
  has_many :rounds, :through => :round_questions, :class_name => "Round::Base", :foreign_key => :round_id
  has_many :round_questions, :foreign_key => :question_id
  has_many :categories, through: :object_categories
  has_many :object_categories, :as => :categorisable
  belongs_to :creator, foreign_key: :creator_id, class_name:"User"

end

