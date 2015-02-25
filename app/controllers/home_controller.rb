class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:my_drills, :all_drills]

  def index
    @user = User.new
  end

  def about
    @user = User.new
  end

  def my_drills
  end

  def all_drills
  end

end
