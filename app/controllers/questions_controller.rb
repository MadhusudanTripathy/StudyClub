class QuestionsController < ApplicationController
    before_action :authenticate_user!
    def index
        @question_lists= Question.all
        # @question_lists.sort_by(&:tag)
        # @question_lists.order('tag')
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts @question_lists.group(:tag).count
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
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
            params.require(:questions).permit(:question, :tag, :user_id)
        end

end
