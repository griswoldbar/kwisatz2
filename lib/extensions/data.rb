# module Data
#   data = YAML.load_file("#{Rails.root}/config/kwisatz_data_objects.yml")
#   data.each_pair do |top_class, sub_data|
#     Data::const_set(top_class, Class::new do
#      def write
#        puts "TEST"
#      end
#     end
#     )  
#   end
# 
# end