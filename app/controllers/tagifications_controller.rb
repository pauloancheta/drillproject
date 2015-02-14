class TagificationsController < ApplicationController

  def create
    @tagification = Tagification.new
    @tagification.tag = params[:tag_id]
    @tagification.drill_group = params[:drill_group_id]
    unless @tagification.save
      flash[:alert] = get_errors
    end
    redirect_to @tagification.drill_group
  end

  def destroy
    @tagification = Tagification.find params[:id]
    if @tagification.destroy
      redirect_to drill_groups_path
    else
      flash[:alert] = get_errors
      redirect_to @tagification.drill_group
    end
  end

  private

  def get_errors
    @tagification.errors.full_messages.join('; ')
  end

end
