class QuizItem < ActiveRecord::Base
  serialize :data, Hash
  belongs_to :quiz, :class_name => "Quiz::Base"
end
