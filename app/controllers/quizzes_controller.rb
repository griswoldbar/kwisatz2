class QuizzesController < ApplicationController
  respond_to :json
  
  def show
    respond_with(@quiz = Quiz::Base.find(params[:id]))
  end

  def create
    @quiz = object_type.new(params[:quiz].merge({creator:current_user}))
    if @quiz.save
      render :json => @quiz
    end
  end
  
  def index
    respond_with(@quizzes = object_type.all)
  end
  
end