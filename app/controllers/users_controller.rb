class UsersController < ApplicationController
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
    @user = User.find(params[:id]) 
      if @user.update(user_params)
        redirect_to users_path, notice: "Updated user!"  
      else   
        flash[:alert] = "Sorry, your user update request failed"
        render :index    
      end
  end

  def destroy
    @user = User.find(params[:id]) 
      if current_user.is_admin? &&  @user.destroy
        redirect_to users_path, notice: "User deleted" 
      else
        flash[:alert] = "Sorry, your user delete request failed"
        render :index         
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :email, :password,
                                 :password_confirmation, :is_admin)
  end
end
