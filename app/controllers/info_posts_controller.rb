class InfoPostsController < ApplicationController
  before_action :set_info_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin?

  def new
    @info_post = InfoPost.new
  end

  def edit
  end

  def create
    @info_post = InfoPost.new(info_post_params)

    respond_to do |format|
      if @info_post.save
        format.html { redirect_to root_path, notice: 'Info post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @info_post.update(info_post_params)
        format.html { redirect_to root_path, notice: 'Info post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @info_post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Info post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end

  private
    def set_info_post
      @info_post = InfoPost.find(params[:id])
    end

    def info_post_params
      params.require(:info_post).permit(:title, :content)
    end
end
