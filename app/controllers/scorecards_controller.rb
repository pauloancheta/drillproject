class ScorecardsController < ApplicationController
  before_action :get_drill_group, except: [:start_attempt, :attempt]
  # Gets the scorecard id for edit, update
  # and destroy actions before execution

  before_action :get_scorecard, only: [:edit, :update, :destroy]
  
  def index
    @scorecards = Scorecard.order(created_at: :desc)
  end

  def create
    @scorecard = Scorecard.new scorecard_params
    if @scorecard.save
      redirect_to [@drill_group, @scorecard]
    else
      flash[:alert] = get_errors
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @scorecard.update scorecard_params
      redirect_to [@drill_group, @scorecard]
    else
      flash[:alert] = get_errors
      render :edit
    end
  end
  
  def destroy
    if @scorecard.destroy
      redirect_to drill_group_scorecards_path(@drill_group)
    else
      flash[:alert] = get_errors
      redirect_to [@drill_group, @scorecard]
    end
  end

  def start_attempt
    @drill_group = DrillGroup.find params[:solution][:drill_group_id]
    @drills = @drill_group.drills
    @scorecard = Scorecard.new
    @scorecard.user = current_user
    @scorecard.drill_group = @drill_group
    @scorecard.total_drills = @drills.length
    if @scorecard.save
      render :do_drills
    else
      flash[:alert] = "Unable to setup drills session; #{get_errors}"
      redirect_to my_drills_path
    end
  end

  def attempt
    @drill_group = DrillGroup.find params[:solution][:drill_group_id]
    @drill = Drill.find params[:solution][:drill_id]
    @scorecard = Scorecard.find params[:solution][:scorecard_id]
    @user_solution = params[:solution][:content]
    @correct = false
    @correct_solutions = ""
    @drill.solutions.each do |solution|
      @correct_solutions += "<strong>"
      @correct_solutions += solution.exact_match ? "Exact Match" : "Regex"
      @correct_solutions += ":</strong> #{solution.content.gsub("\\", "&#92;")}<br />"
      if solution.exact_match && (solution.content == @user_solution)
        @correct = true
      elsif (!solution.exact_match) && (Regexp.new(solution.content) =~ @user_solution)
        @correct = true
      end
    end

    if @correct
      @scorecard.correct_drills += 1
    end
    respond_to do |format|
      if @scorecard.save
        format.js { render }
      else
        flash[:alert] = get_errors
        format.js { render }
      end
    end
  end

  private

  def get_drill_group
    @drill_group = DrillGroup.find params[:drill_group_id]
  end

  def get_scorecard
    @scorecard = Scorecard.find params[:id]
  end

  def scorecard_params
    params.require(:scorecard).permit(:user_id, :drill_group_id, :total_drills, :correct_drills)
  end

  def get_errors
    @scorecard.errors.full_messages.join('; ')
  end

end