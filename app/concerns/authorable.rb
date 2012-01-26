module Authorable
  extend ActiveSupport::Concern

  included do
    belongs_to :creator, foreign_key: :creator_id, class_name:"User"
  end
end