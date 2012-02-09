class QuestionsController < ApplicationController
  respond_to :json
  
  def show
    respond_with(@question = Question::Base.find(params[:id]))
  end

  def create
    @question = object_type.new(params[:question].merge({creator:current_user}))
    if @question.save
      render :json => @question
    end
  end
  
  def index
    respond_with(@questions = object_type.all)
  end
  
end