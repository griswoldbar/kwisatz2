class Quiz::Base < KwisatzObject
  include Categorisable
  include Authorable
  
  class_attribute :round_types
  
  attr_reader :round_count
  
  self.table_name = :quizzes

  self.round_types = [
      ['Simple', Round::Simple],
      ['Blockbusters', Round::Blockbuster],
      ['Jeopardy', Round::Jeopardy]
    ]
  
  validates :name, presence:true
  has_many :rounds, :through => :quiz_rounds, :class_name => "Round::Base"
  has_many :quiz_rounds, :foreign_key => :quiz_id, dependent: :destroy, autosave: true
  has_many :quiz_items, :foreign_key => :quiz_id, dependent: :destroy
  
  def round_count=(val)
    new_round_count = val.to_i
    diff = round_count - new_round_count
    
    p diff
    if diff < 0
      diff.abs.times do
        if self.persisted? 
          puts "im persisted"
          quiz_rounds.create
        else
          quiz_rounds.build
        end
      end
    else
      diff.times do
        quiz_rounds.pop.destroy
      end
    end

    @round_count = new_round_count
  end
  
  def round_count
    @round_count ||= quiz_rounds.size
  end
  
  
  def possible_rounds
    Round::Base.all
  end
  
end