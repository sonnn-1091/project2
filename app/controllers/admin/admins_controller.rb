class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!, :verify_admin!

  def index
    user_select = User.select(:id, :name, :email, :avatar, :status, :is_admin).id_sort
    @users = user_select.page(params[:page]).per Settings.user.per_page
    respond_to do |format|
      format.html
      format.csv{send_data @products.to_csv}
      format.xls{send_data @products.to_csv(col_sep: "\t")}
  end
  end
end
