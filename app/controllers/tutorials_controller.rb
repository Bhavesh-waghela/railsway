class TutorialsController < ApplicationController

  def index
  	@tutorials = Tutorial.all

  	render json: @tutorials
  end

  def new
  @tutorial = Tutorial.new 
  end

  def create
  	@tutorial = Tutorial.create(user_params)
    @tutorial.save

    respond_to do |format|

  		format.json { render :json }
  	end		
  end

  def show
  	@tutorial = Tutorial.find(params[:id])
  end


  private
   def user_params
    params.require(:tutorails).permit(:title, :description, :position)
   end
end
