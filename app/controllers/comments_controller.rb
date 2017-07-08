class CommentsController < ApplicationController
  before_action :load_post, only: [:create, :update, :destroy]
  before_action :load_cmt, only: [:update, :destroy]

  def create
    @comment = @post.comments.build content: params[:content], user: current_user

    if @comment.save
      flash[:success] = t ".commented"
      render json: {comment: render_to_string(@post.comments, layout: false)}
    else
      flash.now[:danger] = t ".fail_comment"
    end
  end

  def update
    if @comment.update_attributes content: params[:content]
      flash[:success] = t ".updated"
      render json: {comment: render_to_string(@post.comments, layout: false)}
    else
      flash.now[:danger] = t ".fail_update"
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = t ".comment_deleted"
      render json: {comment: render_to_string(@post.comments, layout: false)}
    else
      flash[:danger] = t ".fail_delete"
    end
  end

  private

  def load_post
    @post = Post.find_by id: params[:post_id]
    render file: "public/404.html", layout: false unless @post
  end

  def load_cmt
    @comment = Comment.find_by id: params[:id]
    render file: "public/404.html", layout: false unless @comment
  end
end
