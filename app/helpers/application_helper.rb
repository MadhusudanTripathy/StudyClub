module ApplicationHelper
    def get_user_full_name(id)
        if id==current_user.id
            return "You"
        else
            return @user_full_name=User.find(id).full_name
        end
    end
    def get_question(answer_id)
        @q_id=Answer.find(answer_id).question_id
        @q_instance= Question.find(@q_id)
        return @q_instance.question
    end
    def get_dashboard_instance(id)
        @test=Dashboard.find_by(user_id: id)
        return @test
    end
    def get_trend_hash
        @trend_list=Question.all.group(:tag).count.sort_by{|_key, value| value}.reverse
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts @trend_list.class
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        puts '---------------------------------'
        return @trend_list
    end
end
