class RoundsController < ApplicationController
  respond_to :json
  
  def show
    @round = Round::Base.find(params[:id])
    render :json => @round.as_json(:include => 
    {:round_questions => 
      {:include => :question}
    })
  end

  def create
    @round = object_type.new(params[:round].merge({creator:current_user}))
    if @round.save
      render :json => @round
    end
  end
  
  def index
    @rounds = object_type.all
    render :json => @rounds
  end
  
end