class QuestionCategory < ActiveRecord::Base
  serialize :name, Symbol
  serialize :sub_categories, Array
end