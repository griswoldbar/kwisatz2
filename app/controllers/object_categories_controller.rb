class ObjectCategoriesController < ApplicationController
  
  respond_to :js
  
  def create
    object_class = (params[:type].capitalize+"::Base").constantize
    @object = object_class.find(params[:object_id])
    category = Category.find(params[:category_id])
    @object_category = ObjectCategory.create(category: category, categorisable: @object)
    render 'create', layout: false
  end
  
end