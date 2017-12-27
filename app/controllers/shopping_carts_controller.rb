class ShoppingCartsController < ApplicationController
  def show
    @products = []
    unless session[:shoppingcart].nil?
      session[:shoppingcart].each do |product_id, quantity,|
        @products << [Product.find(product_id), quantity,]
      end
    end
  end

  def create
    if session[:shoppingcart].nil?
      session[:shoppingcart] = Hash.new
    end
    product_id = params[:shopping_cart][:product_id]

    if session[:shoppingcart].key?(product_id)
      session[:shoppingcart][product_id] = session[:shoppingcart][product_id] + 1
    else
      session[:shoppingcart][product_id] = 1
    end
  end

  def destroy
    product_id = params[:product_id]
    if session[:shoppingcart].key?(product_id)
      session[:shoppingcart].delete(product_id)
    end
    redirect_to shopping_cart_path
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id)
  end
end
