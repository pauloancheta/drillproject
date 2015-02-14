class SolutionsController < ApplicationController
  	before_action :find_solution, 
                  only: [ :edit, :update, :destroy]

	def new
		@drill = Drill.find params[:drill_id]
		@solution = Solution.new 
		render :new
	end

	def create
		@drill = Drill.find params[:drill_id]
		@solution = Solution.new solution_params
		@solution.drill = @drill
		
		if @solution.save
			redirect_to @solution.drill, notice: "Drill solution successfully created!" 
		else
			render :new 
		end
	end

	def edit
		@drill = Drill.find params[:drill_id]
	end

	def update
		if @solution.update solution_params
      		redirect_to @solution.drill, notice: "Drill solution updated successfully!" #add once drill model exists
   	 	else
      		render :edit
    	end
	end

	def destroy
		@solution.destroy
    	#redirect_to @solution.drill, notice: "Question deleted successfully!" #add this once drill model exists
    	render nothing: true
	end

private
	
	def solution_params
		params.require(:solution).permit(:content, :exact_match)
	end

	 def find_solution
    	@solution = Solution.find params[:id]
  	end
end
