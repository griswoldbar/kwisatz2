class KwisatzObject < ActiveRecord::Base

  self.abstract_class = true

  after_initialize :initialize_data

protected

  def initialize_data
    if self.new_record?
      class_name = self.class.to_s.split("::")
      object_type = class_name[0]
      class_type = class_name[1]
      klass = (use_custom_data_type? ? "#{object_type}Data::#{class_type}".constantize : "#{object_type}Data::Base".constantize)
      self.data = klass.new
    end
  end
  
  def use_custom_data_type?
    false
  end
  
end