class DrillsController < ApplicationController

  # Get the desired drill for the show, edit,
  # update, and destroy actions before they execute
  before_action :get_drill, only: [:show, :edit, :update, :destroy]

  def index
    @drills = Drill.order(created_at: :desc)
  end

  def new
    @drill = Drill.new
  end

  def create
    @drill = Drill.new drill_params
    if @drill.save
      redirect_to @drill
    else
      flash[:alert] = get_errors
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @drill.update drill_params
      redirect_to @drill
    else
      flash[:alert] = get_errors
      render :edit
    end
  end

  def destroy
    if @drill.destroy
      redirect_to drills_path
    else
      flash[:alert] = get_errors
      redirect_to @drill
    end
  end

  private

  def drill_params
    params.require(:drill).permit(:title, :body)
  end

  def get_errors
    @drill.errors.full_messages.join('; ')
  end

end
