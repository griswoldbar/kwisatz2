class RoundItem < ActiveRecord::Base
  belongs_to :round, :class_name => "Round::Base"
  serialize :data, Hash
end
