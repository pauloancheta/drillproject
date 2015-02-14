class SessionsController < ApplicationController
  def new

  end

  def create
    admin = Admin.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      sign_in admin
      redirect_back_or admin
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
