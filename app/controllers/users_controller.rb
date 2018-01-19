class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    @orders = @user.orders
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".success"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email,
      :password, :password_confirmation, :address, :phone, :gender)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
