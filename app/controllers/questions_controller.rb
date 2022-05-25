class QuestionsController < ApplicationController
    before_action :authenticate_user!
    def index
        @question_lists= Question.all
        @user=User.find(current_user.id)
    end
    def create
        @user=User.find(current_user.id)
        @question = @user.questions.create(questions_params)
        redirect_to questions_path
    end
    def show
        @question_instance = Question.find(params[:id])
    end
    def destroy
        @user=User.find(current_user.id)
        @question= @user.questions.find(params[:id])
        @question.destroy
        redirect_to questions_path
    end
    private
        def questions_params
            params.require(:questions).permit(:question, :user_id)
        end
end
