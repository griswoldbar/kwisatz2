class QuizzesController < ApplicationController
  
  respond_to :html, :js
  # layout "quizzes"
  
  def show
    @quiz = Quiz::Base.find(params[:id])
    render 'show', layout: false
  end
  
  def new
    @quiz = Quiz::Base.new
    render 'new', layout: false
  end

  def create
    @quiz = object_type.new(params[:quiz].merge({creator:(current_user || nil)}))
    @quiz.save
    render 'create', layout: false
  end
  
  def index
    @categories = Category.all
    @quizzes = object_type.all
    render 'index'
  end
  
  def edit
    @quiz = Quiz::Base.find(params[:id])
    render 'edit', layout: false
  end
  
  def update
    @quiz = Quiz::Base.find(params[:id])
    @quiz.update_attributes(params[:quiz])
    @quiz.save
    render 'update', layout: false
  end
  
end