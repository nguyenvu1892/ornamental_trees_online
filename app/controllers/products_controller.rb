class ProductsController < ApplicationController

  def index
    if params[:search_text].present?
      @products = Product.all.search_by_name(params[:search_text])
                      .order_desc.paginate(page: params[:page])
    else
      @products = Product.select(:id, :name, :price, :quantity).paginate page: params[:page]
    end
    respond_to do |format|
      format.js {}
    end
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

  private

  def product_params
    params.require(:product).permit :name, :price, :quantity
  end
end
