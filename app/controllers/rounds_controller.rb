class RoundsController < ApplicationController
  # layout "quizzes"
  respond_to :js, :html
    
  def show
    @round = Round::Base.find(params[:id])
    respond_with(@round.with_children)
  end

  def new
    @round = Round::Base.new
    respond_with(@round)
  end
  
  def create
    @round = object_type.new(params[:round].merge({creator:(current_user || nil)}))
    @round.save
    render 'create', layout: false
  end
  
  def edit
    @round = Round::Base.find(params[:id])
    render 'edit', layout: false
  end
  
  def update
    @round = Round::Base.find(params[:id])
    @round.update_attributes(params[:round])
    render 'update', layout: false
  end
  
  def index
    @quiz = Quiz::Base.find(params[:quiz])
    @rounds = object_type.all
    render partial: 'list', layout: false, quiz: @quiz
  end
  
end