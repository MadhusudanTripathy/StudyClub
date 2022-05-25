class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index 
    @dashboard=Dashboard.find_by(user_id: current_user.id)
    @questions_asked=Question.where(user_id: current_user.id)
    @questions_answered=current_user.answers
    # if @dashboard 
    #     puts 'OK To Go'
    # else 
    #     puts '--------------------------'
    #     puts '--------------------------'
    #     puts '--------------------------'
    #     puts @dashboard.inspect
    #     puts '--------------------------'
    #     puts '--------------------------'
    #     puts '--------------------------'
    # end
    @user_name=current_user.full_name
    puts @dashboard.inspect
  end
  def new
    @dashboard =Dashboard.find_by(user_id: current_user.id)
    if @dashboard
      redirect_to dashboard_index_path
    else
      @dashboard=Dashboard.new
    end
  end
  def create
    @user=User.find(current_user.id)
    @dashboard=@user.create_dashboard(dashboard_params)
    if @dashboard.save
      redirect_to dashboard_index_path
    else
      puts 'Error Message'
    end
  end 
  def edit
    @dashboard=Dashboard.find(params[:id])
    unless @dashboard.user_id == current_user.id
      redirect_to dashboard_index_path
      puts '---------------------------------'
      puts '---------------------------------'
      puts '---------------------------------'
      puts 'Unauthorized Access Denied'
      puts '---------------------------------'
      puts '---------------------------------'
      puts '---------------------------------'
    end
  end
  def update
    @dashboard=Dashboard.find(params[:id])
    if @dashboard.user_id == current_user.id
      if @dashboard.update(dashboard_params)
          redirect_to dashboard_index_path
      else    
          render edit_dashboard_path
      end
    else
      puts '--------------------------'
      puts '--------------------------'
      puts '--------------------------'
      puts '--------------------------'
      puts '--------------------------'
      puts '--------------------------'
    end
  end
  private 
  def dashboard_params
    params.require(:dashboard).permit(:qualification, :institute_name, :city, :bio, :image, :user_id)
  end
end
