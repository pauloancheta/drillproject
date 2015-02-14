class AdminsController < ApplicationController
  before_filter :signed_in_admin, only: [:index, :edit, :update, :destroy]
  before_filter :correct_admin, only: [:edit, :update, :destroy]
  def index
    @admins = Admin.paginate(page: params[:page])
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      sign_in @admin
      flash[:success] = "Welcome admin!"
      redirect_to @admin
    else
      render 'new'
    end
  end

  def edit
  end

  def update  
    if @admin.update_attributes(params[:admin])
      sign_in @admin
      flash[:success] = "Profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    flash[:success] = "Admin removed"
    redirect_to admins_path
  end

  private

  def signed_in_admin
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  def correct_admin
    @admin = Admin.find(params[:id])
    redirect_to root_path unless current_admin?(@admin)
  end
end

