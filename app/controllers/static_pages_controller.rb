class StaticPagesController < ApplicationController
  def home
    return unless user_signed_in?
    @post = current_user.posts.build if user_signed_in?
    feed_items = current_user.feed.select :id, :content, :user_id, :created_at, :title, :picture
    @feed_items = feed_items.micropost_sort.page(params[:page]).per Settings.micropost.post_per_page
    render json: {post: render_to_string(@feed_items, layout: false)} if params[:load]
  end
end
