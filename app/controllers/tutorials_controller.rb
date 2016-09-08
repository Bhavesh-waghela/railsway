class TutorialsController < ApplicationController

  def index
     @tutorials = Tutorial.all
    if params[:title]
     @tutorials = Tutorial.search(params[:title])
    else
     @tutorials = Tutorial.all
    end
    respond_to do |format|
     format.html 
     format.json 
    end 
  end

  def new
  @tutorial = Tutorial.new 
  end

  def create
  	@tutorial = Tutorial.create(user_params)
    
     respond_to do |format|
      format.html 
  	 	format.json 
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
