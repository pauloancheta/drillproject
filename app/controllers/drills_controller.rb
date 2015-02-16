class DrillsController < ApplicationController

  before_action :get_drill_group

  # Get the desired drill for the show, edit,
  # update, and destroy actions before they execute
  before_action :get_drill, only: [:show, :edit, :update, :destroy, :attempt]
  # respond_to :js

  def index
    @drills = Drill.order(created_at: :desc)
  end

  def new
    @drill = Drill.new
  end

  def create
    @drill = Drill.new drill_params
    @drill.drill_group = @drill_group

    respond_to do |format|
      if @drill.save
        format.html {redirect_to [@drill_group, @drill]}
        format.js {render}
      else
        flash[:alert] = get_errors
        format.html { render :new }
        format.js {render}
      end
# =======
#     if @drill.save
#       redirect_to [@drill_group, @drill]
#       # respond_with()
#     else
#       flash[:alert] = get_errors
#       render :new
# >>>>>>> upstream/master
    end
    
  end

  def show
    @solutions = @drill.solutions
  end

  def edit
  end

  def update
    if @drill.update drill_params
      redirect_to [@drill_group, @drill]
    else
      flash[:alert] = get_errors
      render :edit
    end
  end
    
  def destroy
    if @drill.destroy
      redirect_to drill_group_path(@drill_group)
    else
      flash[:alert] = get_errors
      redirect_to [@drill_group, @drill]
    end
  end

  def attempt

  end

  private

  def get_drill_group
    @drill_group = DrillGroup.find params[:drill_group_id]
  end

  def get_drill
    @drill = Drill.find params[:id]
  end

  def drill_params
    params.require(:drill).permit(:title, :description)
  end

  def get_errors
    @drill.errors.full_messages.join('; ')
  end

end
