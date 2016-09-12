class VotesController < ApplicationController


  def create
    @vote = Vote.new(user_params)
    @vote.user_id = current_user.id
    @v = Vote.where(:user_id => params[:vote][current_user.id] , :solution_id => params[:vote][:solution_id])
    if  @v.count < 1
      puts "-------#{@v.inspect}-----"
      puts "-------if-----"
      @vote.save
    end 
  end

  private

  def user_params
    params.require(:vote).permit(:user_id , :solution_id)
  end
end
