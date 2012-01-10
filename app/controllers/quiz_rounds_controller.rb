class QuizRoundsController < ApplicationController
  
  def edit
    
  end
  
  def show
    respond_to do |format|
      format.js do
        @quiz_round = QuizRound.find(params[:id])
      end
    end
  end
  
end
