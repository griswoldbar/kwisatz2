class QuizzesController < ApplicationController
  respond_to :json
  
  def show
    @quiz = Quiz::Base.find(params[:id])
    render :json => {quiz:@quiz}
  end

  def create
    @quiz = object_type.new(params[:quiz].merge({creator:current_user}))
    if @quiz.save
      render :json => {quiz:@quiz}
    end
  end
  
  def index
    @quizzes = object_type.all
    render :json => {quizzes:@quizzes}
  end
  
end