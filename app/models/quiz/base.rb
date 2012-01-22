class Quiz::Base < KwisatzObject
  set_table_name :quizzes
  
  validates :name, presence:true
  has_many :rounds, :through => :quiz_rounds, :class_name => "Round::Base"
  has_many :quiz_rounds, :foreign_key => :quiz_id
  has_many :quiz_items, :foreign_key => :quiz_id
  has_many :categories, through: :object_categories
  has_many :object_categories, :as => :categorisable
  belongs_to :creator, foreign_key: :creator_id, class_name:"User"
  
  attr_accessor :round_count
end