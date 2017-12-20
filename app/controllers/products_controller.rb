class ProductsController < ApplicationController

  def search
    search_text = params[:search_text]

    unless search_text.blank?
      @products = Product.where('name LIKE ? OR content LIKE ? OR tags LIKE ?', "%#{search_text}%", "%#{search_text}%", "%#{search_text}%").order('created_at DESC')
    end

    if @products.present?
      @products = @products.paginate(page: params[:page], per_page: 9)
    end

    respond_to do |format|
      format.js {}
    end
  end

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

  def edit
    @product = Product.find(params[:id])
  end
end
