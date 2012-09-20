class QuestionsController < ApplicationController
  respond_to :json
  
  def new
    @question = Question::Base.new
    respond_with(@question)
  end
  
  def create
    @question = object_type.new(params[:question].merge({creator:(current_user || nil)}))
    @question.save
    render 'create', layout: false
  end
  
  def edit
    @question = Question::Base.find(params[:id])
    render 'edit', layout: false
  end
  
  def update
    @question = Question::Base.find(params[:id])
    @question.update_attributes(params[:question])
    render 'update', layout: false
  end
  
  def index
    @quiz = Round::Base.find(params[:quiz])
    @questions = object_type.all
    render partial: 'list', layout: false, quiz: @quiz
  end
  
  def show
    @question = Question::Base.find(params[:id])
    render 'show', layout: false
  end
  
end