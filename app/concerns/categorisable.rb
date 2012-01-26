module Categorisable
  extend ActiveSupport::Concern

  included do
    has_many :categories, through: :object_categories
    has_many :object_categories, :as => :categorisable  
  end
end
