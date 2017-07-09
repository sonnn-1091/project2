class TagsController < ApplicationController
  def show
    @tag = Tag.find_by id: params[:id]
    post = @tag.posts.select :id, :content, :user_id, :created_at, :title, :picture
    @post = post.micropost_sort.page(params[:page]).per Settings.micropost.post_per_page
    @page = params[:page]
    render json: {post: render_to_string(@post, layout: false)} if params[:load]
  end
end
