class KwisatzObject < ActiveRecord::Base

  self.abstract_class = true
  
  class_attribute :use_custom_data_type, :object_type, :class_type
  self.use_custom_data_type = false
  
  after_initialize :initialize_data
  
  protected
  def initialize_data
    #this will create a data object for any kwisatz object. e.g.
    #an object of class Wibble::Blah will have a WibbleData::Blah
    #object set in its data field if @use_custom_data_type is set
    #to true and WibbleData::Base if set to false. 
    if self.new_record?
      klass = data_class
      self.data = klass.new
    end
  end

  protected
  def data_class
    class_name = self.class.to_s.split("::")
    object_type = class_name[0]
    class_type = class_name[1]  
    klass = (self.class.use_custom_data_type ? "#{object_type}Data::#{class_type}".constantize : "#{object_type}Data::Base".constantize)
    klass
  end


  protected
  def self.generate_accessor_methods
    self.object_type = self.name.split("::")[0]
    self.class_type = self.name.split("::")[1]
    if !class_type.blank?
      methods = YAML.load_file("#{Rails.root}/config/kwisatz_data_objects.yml")[object_type][class_type]
      methods.each_pair do |method_name,data_type|
        send :define_method, method_name do
          self.data.instance_variable_get( "@" + method_name.to_s ) 
        end    
        send :define_method, "#{method_name.to_s}=".to_sym do |value|
          self.data.instance_variable_set( "@" + method_name.to_s, value)
        end 
      end
    end
  end
  
end