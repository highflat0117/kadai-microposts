class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @favorite_micropost = Micropost.find(params[:micropost_id])
    current_user.bookmark(@favorite_micropost)
    flash[:success] = '投稿をお気に入りに追加しました'
    redirect_to :back
  end

  def destroy
    @favorite_micropost = Micropost.find(params[:micropost_id])
    current_user.unbookmark(@favorite_micropost)
    flash[:success] = '投稿をお気に入りから解除しました'
    redirect_to :back
  end
end
