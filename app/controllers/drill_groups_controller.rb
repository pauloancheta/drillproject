class DrillGroupsController < ApplicationController

  def index
    @drill_groups = Drill_group.order(name: :asc)
  end


  def new
    @drill_group = Drill_group.new
  end


  def create
    @drill_group = Drill_group.new drill_group_params
    if @drill_group.save
      redirect_to @drill_group, notice: "Drill Group Created!"
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
    if @drill_group.update drill_group_params
      redirect_to @drill_group, notice: "Drill Group Updated!"
    else
      flash[:alert] = get_errors
      render :edit
  end


  def destroy
    if @drill_group.destroy
      redirect_to drill_groups_path 
    else
      flash[:alert] = get_errors
      redirect_to @drill_group
  end



  private

  def drill_group_params
    params.require(:drill_group).permit(:name, :description, :difficulty, :admin_id)
  end

  def get_errors
    @drill.errors.full_messages.join('; ')
  
  end


end
