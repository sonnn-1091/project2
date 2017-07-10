class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, :verify_admin!

  def index
    post = Post.select(:id, :title, :created_at, :user_id).micropost_sort
    @posts = post.page(params[:page]).per Settings.user.per_page
  end
end
