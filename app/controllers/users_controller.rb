class UsersController < ApplicationController
  before_action :user_id, only: [:update, :destroy, :toggle]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Created!"
    else
      flash[:alert] = "Account not created"
      render :new
    end
  end
  
  def index
    authenticate_user!
    @users = User.all
  end
 
  def update
      if @user.update(user_params)
        redirect_to users_path, notice: "Updated user!"  
      else   
        flash[:alert] = "Sorry, your user update request failed"
        render :index    
      end
  end

  def destroy
      if current_user.is_admin? &&  @user.destroy
        redirect_to users_path, notice: "User deleted" 
      else
        flash[:alert] = "Sorry, your user delete request failed"
        render :index         
      end
  end

  def toggle
    if @user.is_admin
      @user.is_admin = false
    else
      @user.is_admin = true
    end
    @user.save
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :email, :password,
                                 :password_confirmation, :is_admin)
  end

  def user_id
    @user = User.find(params[:id]) 
  end
end
