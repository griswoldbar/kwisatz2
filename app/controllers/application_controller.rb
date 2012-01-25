class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def object_type
    if params[:type]
      params[:type].constantize
    else
      params[controller_name.singularize.to_sym][:type].constantize
    end
  end
  
  
end
