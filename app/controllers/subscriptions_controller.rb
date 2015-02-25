class SubscriptionsController < ApplicationController

  before_action :authenticate_user!

  def create
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.new
    @subscription.user = current_user
    respond_to do |format|
      if @subscription.save
        format.js { render }
      else
        format.js { render }
      end
    end
  end

  def destroy
    @drill_group = DrillGroup.find params[:drill_group_id]
    @subscription = @drill_group.subscriptions.find params[:id]
    respond_to do |format|
      if @subscription.destroy
        format.js { render }
      else
        format.js { render }
      end
    end
  end

  private

  def get_errors
    @subscription.errors.full_messages.join('; ')
  end

end
