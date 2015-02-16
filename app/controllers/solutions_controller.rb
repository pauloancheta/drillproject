class SolutionsController < ApplicationController
  before_action :get_drill
  before_action :find_solution,
                  only: [ :edit, :update, :destroy]
  before_action :find_drill, only: [ :new, :create, :edit, :destroy ]

  def new
    @solution = Solution.new

    render :new
  end

  def create
    @solution = Solution.new solution_params
    @solution.drill = @drill
    respond_to do |format|
      if @solution.save
        format.html { redirect_to [@drill.drill_group, @drill], notice: "Solution successfully created!" } #add this once the drill model exists
        format.js { render }
      else
        flash[:alert] = get_errors
        format.html { render :new }
        format.js { render }
      end
    end
  end

  def edit
  end

  def update
    if @solution.update solution_params
      redirect_to [@drill.drill_group, @drill], notice: "Question updated successfully!" #add once drill model exists
    else
      flash[:alert] = get_errors
      render :edit
    end
  end

  def destroy
    if @solution.destroy
      redirect_to [@drill.drill_group, @drill], notice: "Drill solution deleted successfully!"
    else
      flash[:alert] = get_errors
      redirect_to @solution.drill
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
