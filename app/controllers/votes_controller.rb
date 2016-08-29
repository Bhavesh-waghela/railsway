class VotesController < ApplicationController


  def create
    @vote = Vote.new(user_params)
    @vote.user_id = current_user.id
    @vote.save
    render json: @vote
  end

  private

  def user_params
    params.require(:vote).permit(:user_id , :solution_id)
  end
end
