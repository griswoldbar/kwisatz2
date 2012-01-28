class RoundItem < KwisatzObject
  self.table_name = :round_items
  
  belongs_to :round, :class_name => "Round::Base"
end
