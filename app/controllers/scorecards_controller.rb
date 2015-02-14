class ScorecardsController < ApplicationController
  # Gets the scorecard id for edit, update
  # and destroy actions before execution

  before_action :get_scorecard, only: [:edit, :update, :destroy]
  
  def index
    @scorecards = Scorecard.all
  end

  def create
    @scorecard = Scorecard.new scorecard_params
    if @scorecard.save
      flash[:alert] = "Scorecard saved!"
    else
      flash[:alert] = "Unable to save scorecard!"
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    if @scorecard.destroy
      flash[:alert] = "Scorecard deleted!" 
    else
      flash[:alert] = "Unable to delete scorecard!"
  end

  private

  def get_scorecard
    @scorecard = Scorecard.find params[:id]
  end

  def scorecard_params
    params.require(:scorecard).permit(:user_id, :drill_group_id, :total_drills, :correct_drills)
  end

end