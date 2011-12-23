class QuizItem < ActiveRecord::Base
  serialize :data, Hash
  belongs_to :quiz
end
