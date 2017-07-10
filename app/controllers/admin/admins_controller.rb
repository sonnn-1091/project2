class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!, :verify_admin!

  def index
    user_select = User.select(:id, :name, :email, :avatar, :status, :is_admin).id_sort
    @users = user_select.page(params[:page]).per Settings.user.per_page
  end
end
