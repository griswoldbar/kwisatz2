class Quiz::Base < KwisatzObject
  include Categorisable
  include Authorable
  
  class_attribute :quiz_types
  class_attribute :round_types
  
  attr_reader :round_count
  
  self.table_name = :quizzes
  self.quiz_types = [
      ['Simple',Quiz::Simple]
    ]
  
  self.round_types = [
      ['Simple', Round::Simple],
      ['Blockbusters', Round::Blockbuster],
      ['Jeopardy', Round::Jeopardy]
    ]
  
  validates :name, presence:true
  has_many :rounds, :through => :quiz_rounds, :class_name => "Round::Base"
  has_many :quiz_rounds, :foreign_key => :quiz_id, dependent: :destroy
  has_many :quiz_items, :foreign_key => :quiz_id, dependent: :destroy
  
  def round_count=(val)
    @round_count = val.to_i
    @round_count.times { |n| quiz_rounds.build(position: n+1) }
  end
  
  
  def possible_rounds
    Round::Base.all
  end
  
end