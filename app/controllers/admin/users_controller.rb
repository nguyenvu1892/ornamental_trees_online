class Admin::UsersController < ApplicationController

  def index
    @user = User.all.paginate(page: params[:page])
  end
end
