class ScoresController < ApplicationController
	before_action :authenticate_user!

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

  private
    def score_params
      params.require(:score).permit(:game_id, :user_id, :score)
    end
end
