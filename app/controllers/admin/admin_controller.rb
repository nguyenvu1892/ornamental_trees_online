class Admin::AdminController < ApplicationController
  def index
    @user = User.paginate page: params[:page]
    @products = Product.paginate page: params[:page]
  end
end
