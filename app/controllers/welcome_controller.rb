class WelcomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
		@tribes = Tribe.joins(:users).distinct.order("ordering")
		@vote = Vote.joins(:tribes).where("tribes.id = ?", current_user.tribe_id).where(active: true).order("votes.updated_at DESC").first
	end
end
