module ApplicationHelper

  def type_name(thing)
    thing.type.gsub(/.*::/,"").downcase
  end
  
  def base_name(thing)
    thing.type.gsub(/::.*/,"").downcase
  end
  
  def quiz_types
    [
      ['Simple',Quiz::Simple]
    ]
  end
  
end
