class ObjectCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :categorisable, polymorphic:true
  
  validates :primary, uniqueness: {scope: [:categorisable_id, :categorisable_type], :if => :primary}
  

end