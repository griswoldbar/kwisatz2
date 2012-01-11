class QuizRoundsController < ApplicationController
    
  def edit
    respond_to do |format|
      format.js do
        @quiz_round = QuizRound.find(params[:id])
      end
    end
  end
  
  def update
    respond_to do |format|
      format.js do
        @quiz_round = QuizRound.find(params[:id])
        @quiz_round.round = Round::Base.find(params[:round][:id])
        @quiz_round.save!
        render :nothing => true
      end
    end    
  end
  
  def show
    respond_to do |format|
      format.js do
        @quiz_round = QuizRound.find(params[:id])
      end
    end
  end
  
end
