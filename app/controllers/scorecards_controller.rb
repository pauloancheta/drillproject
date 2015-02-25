class ScorecardsController < ApplicationController

  before_action :authenticate_user!

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
      @correct_solutions += "#{solution.content.gsub("\\", "&#92;")} (<em>#{solution.exact_match ? "Exact Match" : "Regex"}</em>)<br />"
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

  def get_errors
    @scorecard.errors.full_messages.join('; ')
  end

end