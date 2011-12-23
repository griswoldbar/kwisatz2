class RoundQuestion < ActiveRecord::Base
  belongs_to :question, :class_name => "Question::Base"
  belongs_to :round, :class_name => "Round::Base"
end