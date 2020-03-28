class VotesController < ApplicationController
  before_action :set_vote, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @votes = Vote.all.order("created_at DESC").paginate(page: params[:page], per_page: 1)
  end

  def new
    @vote = Vote.new
    @tribes = Tribe.all
  end

  def edit
  end

  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
    end
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:title, :content, :active, :poll, :tribe_id, tribe_ids: [])
    end
end
