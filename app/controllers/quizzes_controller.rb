class QuizzesController < ApplicationController
  
  respond_to :html, :js
  # layout "quizzes"
  
  def show
    respond_with(@quiz = Quiz::Base.find(params[:id]))
  end
  
  def new
    @quiz = Quiz::Base.new
  end

  def create
    @quiz = object_type.new(params[:quiz].merge({creator:(current_user || nil)}))
    @quiz.save
    @quiz.round_count.times { |n| @quiz.quiz_rounds.create(position: n+1) }
    render 'create', layout: false
  end
  
  def index
    respond_with(@quizzes = object_type.all)
  end
  
  def edit
    respond_with(@quiz = Quiz::Base.find(params[:id]))
  end
  
end