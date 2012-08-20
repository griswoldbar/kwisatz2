module ApplicationHelper

  def type_name(thing)
    thing.type.gsub(/.*::/,"")
  end
end
