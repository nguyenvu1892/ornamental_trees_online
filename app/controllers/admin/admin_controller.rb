class Admin::AdminController < ApplicationController
  def index
    @products = Product.all
  end
end
