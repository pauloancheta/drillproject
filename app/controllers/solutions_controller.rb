class SolutionsController < ApplicationController
  	before_action :find_solution, 
                  only: [ :edit, :update, :destroy]

	def new
		@solution = Solution.new 
		render :new
	end

	def create
		@solution = Solution.new solution_params

		if @solution.save
			#redirect_to @solution.drill, notice: "Solution successfully created!" #add this once the drill model exists
			render nothing: true
		else
			render :new 
		end
	end

	def edit
	end

	def update
		if @solution.update solution_params
      		#redirect_to @solution.drill, notice: "Question updated successfully!" #add once drill model exists
      		render nothing: true
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
		params.require(:solution).permit()
	end

	 def find_solution
    	@solution = Solution.find params[:id]
  	end
end
