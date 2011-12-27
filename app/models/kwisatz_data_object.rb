class KwisatzDataObject < TablelessModel

  class_attribute :object_type, :class_type  

  protected
  def self.generate_accessor_methods
    self.object_type = self.name.split("::")[0].gsub("Data","")
    self.class_type = self.name.split("::")[1]
    if !class_type.blank?
      methods = YAML.load_file("#{Rails.root}/config/kwisatz_data_objects.yml")[object_type][class_type]
      methods.each_pair do |method_name,data_type|
        send :define_method, method_name do
          instance_variable_get( "@" + method_name.to_s ) 
        end    
        send :define_method, "#{method_name.to_s}=".to_sym do |value|
          instance_variable_set( "@" + method_name.to_s, value)
        end 
      end
    end
  end




end