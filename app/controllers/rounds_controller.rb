class RoundsController < ApplicationController
  respond_to :json
  
  def show
    @round = Round::Base.find(params[:id])
    respond_with(@round.with_children)
  end

  def create
    @round = object_type.new(params[:round].merge({creator:current_user}))
    if @round.save
      render :json => @round.with_children
    end
  end
  
  def index
    respond_with(@rounds = object_type.all)
  end
  
end