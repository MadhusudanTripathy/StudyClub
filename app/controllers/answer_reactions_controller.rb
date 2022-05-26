class AnswerReactionsController < ApplicationController
    before_action :find_answer
    before_action :find_like, only: [:destroy]
    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @answer.answer_reactions.create(user_id: current_user.id)
        end
        redirect_to questions_path
    end
    def destroy
        @like.destroy
        redirect_to questions_path
    end
    private
    def find_answer
        @answer = Answer.find(params[:answer_id])
    end
    def already_liked?
        AnswerReaction.where(user_id: current_user.id, answer_id:
        params[:answer_id]).exists?
    end
    def find_like
        @like = @answer.answer_reactions.find(params[:id])
    end
end
