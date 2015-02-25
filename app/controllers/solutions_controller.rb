class SolutionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_drill
  before_action :find_solution,
                  only: [ :edit, :update, :destroy]
  before_action :find_drill, only: [ :new, :create, :edit, :destroy ]

  def new
    @drill_group = @drill.drill_group
    @solution = Solution.new
    respond_to do |format|
      format.js { render }
    end
  end

  def create
    @solution = Solution.new solution_params
    @solution.drill = @drill
    respond_to do |format|
      if @solution.save
        format.js { render }
      else
        format.js { render }
      end
    end
  end

  def edit
    @drill = Drill.find params[:drill_id]
    @solution = Solution.find params[:id]
    respond_to do |format|
      format.js { render }
    end
  end

  def update
    respond_to do |format|
      if @solution.update solution_params
        format.js { render }
      else
        format.js { render }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @solution.destroy
        format.js { render }
      else
        format.js { render }
      end
    end
  end

  private

  def get_drill
    @drill = Drill.find params[:drill_id]
  end

  def solution_params
    params.require(:solution).permit(:content, :exact_match)
  end

  def find_solution
    @solution = Solution.find params[:id]
  end

  def find_drill
    @drill = Drill.find params[:drill_id]
  end

  def get_errors
    @solution.errors.full_messages.join('; ')
  end
end
