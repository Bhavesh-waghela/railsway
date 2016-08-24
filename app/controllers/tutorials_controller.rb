class TutorialsController < ApplicationController

  def index
  	@tutorials = Tutorial.all

  	render json: @tutorials
  end

  def new
  @tutorial = Tutorial.new 
  end

  def create
  	@tutorial = Tutorial.create(title: params[:title] , description: params[:description] , position: params[:position])
    @tutorial.save

    respond_to do |format|

  		format.json { render :json }
  	end		
  end

  def show
  	@tutorial = Tutorial.find(params[:id])
  end
end
