class ShoppingCartsController < ApplicationController
  def show
    @carts = Cart.new_cart request.session_options[:id]
  end

  def create
    session_id = request.session_options[:id]
    cart = Cart.find_by session_id: session_id, product_id: params[:cart][:product_id]
    if cart.nil?
      cart = Cart.new cart_params
      cart.session_id = session_id
      cart.quantity = 1
      cart.save
    else
      cart.quantity = cart.quantity + 1
      cart.save
    end
  end

  def destroy
    @cart = Cart.find_by id: params[:id]
    @cart.destroy
     respond_to do |format|
      format.html { redirect_to shopping_cart_path }
     end
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id)
  end
end
