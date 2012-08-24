module ApplicationHelper

  def type_name(thing)
    thing.type.gsub(/.*::/,"")
  end
  
  def quiz_types
    [
      ['Simple',Quiz::Simple]
    ]
  end
  
end
