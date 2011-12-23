class Quiz < ActiveRecord::Base
  validates_presence_of :name
  has_many :rounds, :through => :quiz_rounds
  has_many :quiz_rounds
  has_many :quiz_items
end