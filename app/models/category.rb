class Category < ActiveRecord::Base
  has_many :object_categories
  has_many :quizzes,   through: :object_categories, source: :categorisable, source_type: 'Quiz::Base'
  has_many :rounds,    through: :object_categories, source: :categorisable, source_type: 'Round::Base'
  has_many :questions, through: :object_categories, source: :categorisable, source_type: 'Question::Base'
  
  has_many :sub_categories, class_name:"Category", foreign_key:"parent_category_id"
  belongs_to :parent_category, class_name:"Category", foreign_key:"parent_category_id"
  
  belongs_to :creator, class_name:"User"
  
  validates :name, presence:true
end