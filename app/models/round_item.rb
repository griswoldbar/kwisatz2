class RoundItem < KwisatzObject
  set_table_name :round_items
  
  belongs_to :round, :class_name => "Round::Base"
end
