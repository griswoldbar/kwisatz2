class RoundQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :round
end