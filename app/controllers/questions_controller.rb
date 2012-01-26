class QuestionsController < ApplicationController
  respond_to :json
  
  def show
    @question = Question::Base.find(params[:id])
    render :json => {question:@question}
  end

  def create
    @question = object_type.new(params[:question].merge({creator:current_user}))
    if @question.save
      render :json => {question:@question}
    end
  end
  
  def index
    @questions = object_type.all
    render :json => {questions:@questions}
  end
  
end