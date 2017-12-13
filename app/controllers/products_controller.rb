class ProductsController < ApplicationController
  def index
    @products = Product.select(:id, :name, :price, :quantity).paginate page: params[:page]
  end

  def show
    @product = Product.find_by id: params[:id]

    if @product
      flash[:success] = "Found product"
    else
      flash[:danger] = "Product not found"
      redirect_to products_url
    end
  end
end
