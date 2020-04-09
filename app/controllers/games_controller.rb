class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin?, except: [:play, :index]
  before_action :played_current_game, only: [:play]

  def index
    if current_user.admin?
      @games = Game.all.order("created_at DESC").paginate(page: params[:page], per_page: 1)
    else
      @games = Game.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to root_path, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to root_path, notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_path, notice: 'Game was successfully destroyed.' }
    end
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end

  def play
    @score = Score.new
  end

  def played_current_game
    @live_game = Game.where(active: true).order("created_at DESC").first
    if Score.where(user_id: current_user.id, game_id: @live_game.id).count > 0
      redirect_to games_path, notice: 'You have already played this game.'
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :active)
    end
end
