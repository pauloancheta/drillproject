class DrillGroupsController < ApplicationController

  def index
    @drill_groups = DrillGroup.order(name: :asc)
  end


  def new
    @drill_group = DrillGroup.new
  end


  def create
    @drill_group = DrillGroup.new drill_group_params
    # @drill_group.user = current_user
    if @drill_group.save
      redirect_to @drill_group, notice: "Drill Group Created!"
    else
      flash[:alert] = get_errors
      render :new
    end
  end


  def show
    @drill_group = DrillGroup.find(params[:id])
    @current_user = User.last
  end


  def edit
    @drill_group = DrillGroup.find(params[:id])
  end


  def update
    @drill_group = DrillGroup.find(params[:id])
    if @drill_group.update drill_group_params
      redirect_to @drill_group, notice: "Drill Group Updated!"
    else
      flash[:alert] = get_errors
      render :edit
    end
  end


  def destroy
    @drill_group = DrillGroup.find(params[:id])
    if @drill_group.destroy
      redirect_to drill_groups_path 
    else
      flash[:alert] = get_errors
      redirect_to @drill_group
    end
  end



  private

  def drill_group_params
    params.require(:drill_group).permit(:name, :description, :level_id)
  end

  def get_errors
    @drill.errors.full_messages.join('; ')
  
  end


end
