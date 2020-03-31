class WelcomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
		@tribes = Tribe.joins(:users).distinct.order("ordering")
		@vote = Vote.joins(:tribes).where("tribes.id = ?", current_user.tribe_id).where(active: true).order("votes.updated_at DESC").first
		@poll = Poll.new
		@current_user_recent_vote = @vote.polls.where(user_id: current_user.id).order("created_at DESC").first unless @vote.nil?
	end
end
