class SubscriptionsController < ApplicationController

  def create
    drill_group = DrillGroup.find params[:drill_group_id]
    subscription = drill_group.subscriptions.new
    if subscription.save
      redirect_to drill_group, notice: "Subscribed!"
    else
      redirect_to drill_group, alert: "Subscribed Failed"
    end
  end


  def destroy
    drill_group = DrillGroup.find params[:drill_group_id]
    subscription = drill_group.subscriptions.find params[:id]
    if subscription.destroy
      redirect_to drill_group, notice: "Unsubscribed!"
    else
      redirect_to drill_group, alert: "Cannot unsubscribe!"
    end
        
  end


end
