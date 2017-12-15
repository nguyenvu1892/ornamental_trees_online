class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    if params[:product][:category_id]
      @category = Category.find_by(id: params[:product][:category_id])
      @product = @category.products.build product_params
      if @product.save
        flash[:success] = t ".success"
        redirect_to admin_root_url
      else
        render :new
      end
    else
      flash[:success] = t ".nocategory"
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :price, :quantity
  end
end
