class ObjectCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :categorisable, polymorphic:true
end