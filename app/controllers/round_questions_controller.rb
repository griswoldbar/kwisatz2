class RoundQuestionsController < ApplicationController
  
  respond_to :js
  # layout "quizzes"
  
  def update
    @round_question = RoundQuestion.find(params[:id])
    @round_question.question = Question::Base.find(params[:question_id])
    @round_question.save
    render nothing: true
  end
  
  def destroy
    @round_question = RoundQuestion.find(params[:id])
    @round_question.destroy
    render 'destroy', layout: false
  end
  
end