class SolutionsController < ApplicationController
  
  def all_solutions
    @solutions = Solution.all
  end

  def index
    if params[:tag]
       @solutions = Solution.tagged_with(params[:tag])
    else
      @solutions = Solution.all
      @solutions.each do |solution|
        solution.votes
      end
    end
    respond_to do |format|
     format.html 
     format.json 
    end 
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.create(user_params)
    respond_to do |format|
     format.html 
     format.json 
    end 
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def show
    @solution = Solution.find(params[:id])
    respond_to do |format|
     format.html 
     format.json 
    end
  end
  private

  def user_params
    params.require(:solutions).permit(:question, :answer)
  end
end