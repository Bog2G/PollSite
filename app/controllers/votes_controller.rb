class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
  end

  private
  def vote_params
    params.require(:vote).permit(:question_id, :user_id, :poll_id)
  end
end
