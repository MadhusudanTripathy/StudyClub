class QuestionReactionsController < ApplicationController
    before_action :find_question
    before_action :find_like, only: [:destroy]
    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @question.question_reactions.create(user_id: current_user.id)
        end
        redirect_to questions_path
    end
    def destroy
        @like.destroy
        redirect_to questions_path
    end
    private
    def find_question
        @question = Question.find(params[:question_id])
    end
    def already_liked?
        QuestionReaction.where(user_id: current_user.id, question_id:
        params[:question_id]).exists?
    end
    def find_like
        @like = @question.question_reactions.find(params[:id])
    end
end
