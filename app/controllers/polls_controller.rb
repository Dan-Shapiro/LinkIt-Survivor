class PollsController < ApplicationController
	before_action :authenticate_user!

	def new
		@poll = Poll.new
	end

	def create
	  @poll = Poll.new(poll_params)

	  respond_to do |format|
	    if @poll.save
	      format.html { redirect_to root_path, notice: 'Vote was successfully cast.' }
	    else
	      format.html { redirect_to root_path, notice: 'Vote failed to be cast.' }
	    end
	  end
	end

  private
    def poll_params
      params.require(:poll).permit(:vote_id, :user_id, :vote_for)
    end
end
