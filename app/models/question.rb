class Question < ActiveRecord::Base
  has_many :rounds, :through => :round_questions
  has_many :round_questions
  serialize :data, Hash
  validates_presence_of :data
end