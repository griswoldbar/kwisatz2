class RoundsController < ApplicationController
  layout "quizzes"
  respond_to :js, :html
    
  def show
    @round = Round::Base.find(params[:id])
    respond_with(@round.with_children)
  end

  def create
    @quiz = Quiz::Base.find(params[:quiz][:id])
    @round = object_type.new(params[:round].merge({creator:(current_user || nil)}))
    @round.quizzes << @quiz
    @round.save
    render 'create', layout: false
  end
  
  def edit
  
  end
  
  def index
    respond_with(@rounds = object_type.all)
  end
  
end