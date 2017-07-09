class UsersController < ApplicationController
  load_resource

  def index
    user_select = User.select(:id, :name, :email, :avatar, :created_at).id_sort
    @users = user_select.page(params[:page]).per Settings.user.per_page
    @page = params[:page]
    render json: {user: render_to_string(@users, layout: false)} if params[:load]
  end

  def show
    user = User.find_by id: params[:id]
    post_select = user.posts.select :id, :content, :user_id, :created_at, :title, :picture
    @posts = post_select.micropost_sort.page(params[:page]).per Settings.micropost.post_per_page
    @page = params[:page]
    render json: {post: render_to_string(@posts, layout: false)} if params[:load]
  end

  def following
    @title = t ".following"
    users = @user.following.select(:id, :email, :name, :created_at).id_sort
    @users = users.page(params[:page]).per Settings.user.per_page
    @page = params[:page]
    render :show_follow, locals: {user: @user}
  end

  def followers
    @title = t ".followers"
    users = @user.followers.select(:id, :email, :name, :created_at).id_sort
    @users = users.page(params[:page]).per Settings.user.per_page
    @page = params[:page]
    render :show_follow
  end
end
