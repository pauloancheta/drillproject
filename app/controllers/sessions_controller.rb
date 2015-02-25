class SessionsController < ApplicationController

  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.find_by_email params[:user][:email]
    respond_to do |format|
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Logged in!" }
        format.js { render js: "window.location = '/'" }
      else
        format.html {
          flash[:alert] = "Wrong email or password"
          render :new
        }
        format.js { render }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
