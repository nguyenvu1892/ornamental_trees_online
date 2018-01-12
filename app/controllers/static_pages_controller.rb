class StaticPagesController < ApplicationController
  def home
    @products = Product.select(:id, :name, :price, :quantity, :image).paginate page: params[:page]
  end

  def about
  end
end
