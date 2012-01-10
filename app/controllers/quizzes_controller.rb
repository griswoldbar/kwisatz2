class QuizzesController < ApplicationController
    
  def new
    @quiz = Quiz::Base.new  
  end
  
  def create
    respond_to do |format|
      format.js do
        @quiz = Quiz::Base.create(params[:quiz])
        @quiz.type = "Quiz::#{params[:quiz][:type]}"
        @quiz.round_count = params[:quiz][:round_count].to_i
        if @quiz.save
          render 'rounds_form', :layout => false
        end
      end
    end
  end
  

  
end