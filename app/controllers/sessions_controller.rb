class SessionsController < ApplicationController

  before_action :authenticate_user!, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email params[:user][:email]
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
