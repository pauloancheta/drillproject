class SubscriptionsController < ApplicationController

  def create
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.new
    @subscription.user = current_user
    if @subscription.save
      redirect_to @drill_group
    else
      redirect_to @drill_group, alert: get_errors
    end
  end


  def destroy
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.find params[:id]
    if @subscription.destroy
      redirect_to @drill_group
    else
      redirect_to @drill_group, alert: get_errors
    end
        
  end

  private

  def get_errors
    @subscription.errors.full_messages.join('; ')
  end

end
