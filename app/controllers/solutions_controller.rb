class SolutionsController < ApplicationController

  def index
    @solutions = Solution.all
     @solutions.each do |solution|
       solution.votes
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

  def show
    @solution = Solution.find(params[:id])
    respond_to do |format|
     format.html 
     format.json 
    end
  end

  private

  def user_params
    params.require(:solutions).permit(:question, :answer , :vote_id)
  end
end
