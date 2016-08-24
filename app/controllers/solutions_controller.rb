class SolutionsController < ApplicationController
  def index
  	@solutions = Solution.all

  	render json: @solutions
  end

  def new
  	@solution = Solution.new
  end

  def create
  	@solution = Solution.create(question: params[:question], answer: params[:answer])
  	@solution.save

  	respond_to do |format|
  		format.json { render :json }
  	end	
  end

  def show
  	@solution = Solution.find(params[:id])
  end
end
