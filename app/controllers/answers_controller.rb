class AnswersController < ApplicationController
    before_action :authenticate_user!
    def create
        @question= Question.find(params[:question_id])
        puts "---------------------------------"
        puts "---------------------------------"
        puts "---------------------------------"
        puts params.inspect 
        puts "---------------------------------"
        puts "---------------------------------"
        puts "---------------------------------"
        @answer= @question.answers.new(answer_params)
        if @answer.save 
            redirect_to question_path(@question)
        end
    end
    def destroy
        @question= Question.find(params[:question_id])
        @answer= @question.answers.find(params[:id])
        puts "---------------------------------"
        puts "---------------------------------"
        puts "---------------------------------"
        puts params.inspect
        puts "---------------------------------"
        puts "---------------------------------"
        puts "---------------------------------"
        @answer.destroy
        redirect_to question_path(@question)
    end    
    private
        def answer_params
            params.require(:answer).permit(:answer, :user_id)
        end
end
