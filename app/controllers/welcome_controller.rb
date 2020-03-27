class WelcomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
		@tribes = Tribe.joins(:users).distinct.order("ordering")
	end
end
