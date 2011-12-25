class KwisatzObject < ActiveRecord::Base

  self.abstract_class = true
  class << self; attr_accessor :use_custom_data_type; end  
  @use_custom_data_type = false
  
  after_initialize :initialize_data

  
protected
  def initialize_data
    if self.new_record?
      class_name = self.class.to_s.split("::")
      object_type = class_name[0]
      class_type = class_name[1]
      klass = (self.class.use_custom_data_type ? "#{object_type}Data::#{class_type}".constantize : "#{object_type}Data::Base".constantize)
      self.data = klass.new
    end
  end
  
end