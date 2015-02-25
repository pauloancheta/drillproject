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
      format.html { render }
      format.js { render }
    end
  end

  def create
    @solution = Solution.new solution_params
    @solution.drill = @drill
    respond_to do |format|
      if @solution.save
        format.html { redirect_to [@drill.drill_group, @drill], notice: "Solution successfully created!" } #add this once the drill model exists
        format.js { render }
      else
        format.html { 
          flash[:alert] = get_errors
          render :new
        }
        format.js { render }
      end
    end
  end

  def edit
    @drill = Drill.find params[:drill_id]
    @solution = Solution.find params[:id]
    respond_to do |format|
      format.html { render }
      format.js { render }
    end
  end

  def update
    respond_to do |format|
      if @solution.update solution_params
        format.html { redirect_to [@drill.drill_group, @drill], notice: "Question updated successfully!" }
        format.js { render }
      else
        format.html {
          flash[:alert] = get_errors
          render :edit
        }
        format.js { render }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @solution.destroy
        format.html { redirect_to [@drill.drill_group, @drill], notice: "Drill solution deleted successfully!" }
        format.js { render }
      else
        format.html {
          flash[:alert] = get_errors
          redirect_to @solution.drill
        }
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
