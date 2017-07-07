class UsersController < ApplicationController
  load_resource

  def index
    user_select = User.select(:id, :name, :email, :avatar, :created_at).id_sort
    @users = user_select.paginate page: params[:page], per_page: Settings.user.per_page
  end

  def show
    user = User.find_by id: params[:id]
    post_select = user.posts.select :id, :content, :user_id, :created_at, :title, :picture
    @posts = post_select.micropost_sort.paginate page: params[:page],
      per_page: Settings.micropost.post_per_page
  end

  def following
    @title = t ".following"
    users = @user.following.select(:id, :email, :name).id_sort
    @users = users.paginate page: params[:page], per_page: Settings.user.per_page
    render :show_follow
  end

  def followers
    @title = t ".followers"
    @users = @user.followers.select(:id, :email, :name).id_sort.paginate page: params[:page],
      per_page: Settings.user.per_page
    render :show_follow
  end
end
