class ScoresController < ApplicationController
	before_action :authenticate_user!
  before_action :played_current_game, only: [:create]

	def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        current_game = Game.where(active: true).order("created_at DESC").first
        current_score = Score.where(user_id: current_user.id, game_id: current_game.id).order("created_at DESC").first
        format.html { redirect_to games_path, notice: "Score was successfully saved. Your score: #{current_score.score}" }
      else
        format.html { render :new }
      end
    end
  end

  def played_current_game
    live_game = Game.where(active: true).order("created_at DESC").first
    if Score.where(user_id: current_user.id, game_id: live_game.id).count > 0
      redirect_to games_path, notice: 'You have already played this game.'
    end
  end

  private
    def score_params
      params.require(:score).permit(:game_id, :user_id, :score)
    end
end
