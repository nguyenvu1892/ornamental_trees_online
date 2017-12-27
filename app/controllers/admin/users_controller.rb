class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:destroy, :index]

  def index
    @user = User.all.paginate(page: params[:page])
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.present?
      if @user.destroy
        flash[:success] = t "admin.users.destroy.success"
        redirect_to admin_users_url
      else
        flash[:danger] = t "admin.users.destroy.danger"
        redirect_to admin_users_url
      end
    else
      flash[:danger] = t "admin.users.destroy.danger"
      redirect_to admin_root_url
    end
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "admin.private.logged_in.pls_login"
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
