class ScorecardsController < ApplicationController

  before_action :authenticate_user!

  def randomize
    @output = []
    current_user.drill_group_subscriptions.each do |drill_group|
      if drill_group.drills.length > 0
        scorecard = Scorecard.new
        scorecard.user = current_user
        scorecard.drill_group = drill_group
        scorecard.total_drills = drill_group.drills.length
        unless scorecard.save
          (flash[:alert] ||= "") << "Error in creating scorecard(s); #{get_errors}"
        end
        drill_group.drills.each do |drill|
          @output << [scorecard, drill]
        end
      end
    end
    @output.shuffle!
    if flash[:alert]
      redirect_to my_drills_path
    else
      render :randomize_drills
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
    @scorecard.save
    respond_to do |format|
      format.js { render }
    end
  end

  private

  def get_errors
    @scorecard.errors.full_messages.join('; ')
  end

end