class RoundItem < KwisatzObject
  belongs_to :round, :class_name => "Round::Base"
end
