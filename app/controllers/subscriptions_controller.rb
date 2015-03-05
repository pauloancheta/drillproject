class SubscriptionsController < ApplicationController

  before_action :authenticate_user!

  def create
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.new
    @subscription.user = current_user
    @subscription.save
    respond_to do |format|
      format.js { render }
    end
  end

  def destroy
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.find params[:id]
    @subscription.destroy
    respond_to do |format|
      format.js { render }
    end
  end

  private

  def get_errors
    @subscription.errors.full_messages.join('; ')
  end

end
