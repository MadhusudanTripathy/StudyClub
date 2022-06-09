class FavAnswersController < ApplicationController
    before_action :find_answer
    before_action :find_fav, only: [:destroy]
    def create
        if already_faved?
            flash[:notice] = "You can't like more than once"
        else
            @answer.fav_answers.create(user_id: current_user.id)
        end
        redirect_to questions_path
    end
    def destroy
        @fav_present.destroy
        redirect_to questions_path
    end
    private
        def find_answer
            @answer = Answer.find(params[:answer_id])
        end
        def already_faved?
            FavAnswer.where(user_id: current_user.id, answer_id:
            params[:answer_id]).exists?
        end
        def find_fav
            @fav_present = @answer.fav_answers.find(params[:id])
        end
end
