class SolutionsController < ApplicationController

  def index
    @solutions = Solution.all
     @solutions.each do |solution|
       solution.votes
    end
  	render json: @solutions
  end

  def new
  	@solution = Solution.new
  end

  def create
  	@solution = Solution.create(user_params)
  	respond_to do |format|
  		format.json { render :json }
  	end	
  end

  def show
    @solution = Solution.find(params[:id])
    render json: @solution
  end

  private

  def user_params
    params.require(:solutions).permit(:question, :answer)
  end
end
