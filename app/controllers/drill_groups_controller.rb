class DrillGroupsController < ApplicationController

  def index
    @drill_groups = DrillGroup.order(name: :asc)
  end


  def new
    @drill_group = DrillGroup.new
    respond_to do |format|
      format.html { render }
      format.js { render }
    end
  end


  def create
    @drill_group = DrillGroup.new drill_group_params
    @drill_group.user_id = current_user.id

    if @drill_group.save
      redirect_to drill_groups_path, notice: "Drill Group Created!"
    else
      flash[:alert] = get_errors
      render :new
    end
  end


  def show
    @drill_group = DrillGroup.find(params[:id])
    @drills = @drill_group.drills

    if @drill_group.drills.length > 0
      @drill = @drill_group.drills
    end
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
    respond_to do |format|
      if @drill_group.destroy
        format.html { redirect_to drill_groups_path }
        format.js { render } 
      else
        format.html { redirect_to @drill_group, alert: get_errors }
        format.js { render }
      end
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
