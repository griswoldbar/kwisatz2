class QuizRoundsController < ApplicationController
  
  respond_to :js
  # layout "quizzes"
  
  def update
    @quiz_round = QuizRound.find(params[:id])
    @quiz_round.round = Round::Base.find(params[:round_id])
    @quiz_round.save
    render nothing: true
  end
  
end