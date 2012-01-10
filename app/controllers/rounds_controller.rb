class RoundsController < ApplicationController


private
  def round_type
    params[:type].constantize
  end
  
end