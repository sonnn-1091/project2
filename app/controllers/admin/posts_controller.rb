class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, :verify_admin!

  def index
    post = Post.select(:id, :title, :created_at, :user_id).micropost_sort
    @posts = post.page(params[:page]).per Settings.user.per_page

    @by_week = Post.group_by_week(:created_at).size
    @by_day = Post.group_by_day_of_week(:created_at, format: "%a").size
    @tags = Tag.group(:name).limit(Settings.user.per_page).size
  end

  def destroy
    post = Post.find_by id: params[:id]
    if post.destroy
      flash[:success] = t ".deleted"
    else
      flash.now[:danger] = t ".fail"
    end
    redirect_to request.referrer || root_url
  end
end
