class DrillGroupsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @drill_groups = DrillGroup.order(name: :asc)
  end

  def new
    @drill_group = DrillGroup.new
    respond_to do |format|
      format.js { render }
    end
  end

  def create
    @drill_group = DrillGroup.new drill_group_params
    @drill_group.user_id = current_user.id
    @drill_group.save
    respond_to do |format|
      format.js { render }
    end
  end

  def show
    @drill_group = DrillGroup.find(params[:id])
    @drills = @drill_group.drills

    if @drill_group.drills.length > 0
      @drill = @drill_group.drills
    end

    respond_to do |format|
      format.js { render }
    end
  end

  def edit
    @drill_group = DrillGroup.find(params[:id])
    respond_to do |format|
      format.js { render }
    end
  end

  def update
    @drill_group = DrillGroup.find(params[:id])
    @drill_group.update drill_group_params
    respond_to do |format|
      format.js { render }
    end
  end

  def destroy
    @drill_group = DrillGroup.find(params[:id])
    @drill_group.destroy
    respond_to do |format|
      format.js { render }
    end
  end

  private

  def drill_group_params
    params.require(:drill_group).permit(:name, :description, :level_id, :tag_ids)
  end

  def get_errors
    @drill.errors.full_messages.join('; ')
  
  end

end
