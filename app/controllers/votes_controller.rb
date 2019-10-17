# class VotesController < ApplicationController
#   def new
#     @vote = Vote.new(vote_params)
#   end
  
#   def create
#     # create a new vote with the current work passed in
#     # and the current user passed in 
#     @vote = Vote.new(date: Time.now, user_id: user_id, work_id: work_id)
#     if @vote.save
#       flash.now[:success] = "Successfully upvoted!"
#     else
#       flash.now[:error] = "Oops! Something went wrong."
#     end

#   end 

#   private
  
#   def vote_params
#     params.require(:vote).permit(:user, :work)
#   end 

# end
