class RoundItem < ActiveRecord::Base
  belongs_to :round
  serialize :data, Hash
end
