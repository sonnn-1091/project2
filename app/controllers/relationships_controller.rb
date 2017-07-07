class RelationshipsController < ApplicationController
  def create
    @user = User.find_by id: params[:id]
    current_user.follow @user
    render json: {button_html: render_to_string(partial: "users/follow_form", layout: false)}
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    render json: {button_html: render_to_string(partial: "users/follow_form", layout: false)}
  end
end
