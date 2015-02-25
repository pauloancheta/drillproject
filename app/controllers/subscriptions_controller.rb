class SubscriptionsController < ApplicationController

  before_action :authenticate_user!

  def create
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.new
    @subscription.user = current_user
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to all_drills_path }
        format.js { render }
      else
        format.html { redirect_to all_drills_path, alert: get_errors }
        format.js { render }
      end
    end
  end

  def destroy
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.find params[:id]
    respond_to do |format|
      if @subscription.destroy
        format.html { redirect_to my_drills_path }
        format.js { render }
      else
        format.html { redirect_to my_drills_path, alert: get_errors }
        format.js { render }
      end
    end
  end

  private

  def get_errors
    @subscription.errors.full_messages.join('; ')
  end

end
