class ConfessionalsController < ApplicationController
  before_action :set_confessional, only: [:destroy]
  before_action :authenticate_user!
  before_action :is_admin?, only: [:index]

  def index
    @confessionals = Confessional.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @confessional = Confessional.new
  end

  def create
    @confessional = Confessional.new(confessional_params)

    respond_to do |format|
      if @confessional.save
        format.html { redirect_to @confessional, notice: 'Confessional was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @confessional.destroy
    respond_to do |format|
      format.html { redirect_to confessionals_url, notice: 'Confessional was successfully destroyed.' }
    end
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end

  private
    def set_confessional
      @confessional = Confessional.find(params[:id])
    end

    def confessional_params
      params.require(:confessional).permit(:user_id, :content)
    end
end
