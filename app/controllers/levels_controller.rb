class LevelsController < ApplicationController

  before_action :get_level, only: [:show, :edit, :update, :destroy]

  def index
    @levels = Level.all
  end

  def new
    @level = Level.new
  end

  def create
    @level = Level.new level_params
    if @level.save
      redirect_to @level
    else
      flash[:alert] = get_errors
      render :new
    end
  end

  def show
    @drills = @level.drills
  end

  def edit
  end

  def update
    if @level.update level_params
      redirect_to @level
    else
      flash[:alert] = get_errors
      render :edit
    end
  end

  def destroy
    if @level.destroy
      redirect_to levels_path
    else
      flash[:alert] = get_errors
      redirect_to @level
    end
  end

  private

  def level_params
    params.require(:level).permit(:title)
  end

  def get_level
    @level = Level.find params[:id]
  end

  def get_errors
    @level.errors.full_messages.join('; ')
  end

end
