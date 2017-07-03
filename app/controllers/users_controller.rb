class UsersController < ApplicationController
  load_resource

  def index
    user_select = User.select(:id, :name, :email, :avatar).id_sort
    @users = user_select.paginate page: params[:page],
      per_page: Settings.user.per_page
  end
end
