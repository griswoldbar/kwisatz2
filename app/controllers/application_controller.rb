class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def object_type
    if obj_type = params[:type]
      obj_type.constantize
    elsif obj_type = params[controller_name.singularize.to_sym][:type] rescue nil
      obj_type.constantize
    else 
      obj_type = (controller_name.singularize.camelize+"::Base").constantize
    end
  end
  
  
end
