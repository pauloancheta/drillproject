class DrillsController < ApplicationController

  before_action :authenticate_admin!
  before_action :get_drill_group

  # Get the desired drill for the show, edit,
  # update, and destroy actions before they execute
  before_action :get_drill, only: [:show, :edit, :update, :destroy]
  # respond_to :js

  def new
    @drill_group = DrillGroup.find params[:drill_group_id]
    respond_to do |format|
      format.js { render }
    end
  end

  def create
    @drill = Drill.new drill_params
    @drill.drill_group = @drill_group

    respond_to do |format|
      if @drill.save
        format.js { render }
      else
        format.js { render }
      end
    end
    
  end

  def edit
    respond_to do |format|
      format.js { render }
    end
  end

  def update
    respond_to do |format|
      if @drill.update drill_params
        format.js { render }
      else
        format.js { render }
      end
    end
  end
    
  def destroy
    respond_to do |format|
      if @drill.destroy
        format.js { render }
      else
        format.js { render }
      end
    end
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
