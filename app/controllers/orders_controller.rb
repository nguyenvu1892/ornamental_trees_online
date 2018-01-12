class OrdersController < ApplicationController

  def new
    @order = Order.new
    carts = Cart.new_cart request.session_options[:id]
    carts.each do |cart|
      @order.order_details.build(product_id: cart.product_id, quantity: cart.quantity)
    end
  end

  def create
    if logged_in?
      @order = @current_user.orders.build order_params
      if @order.save!
        flash[:success] = t ".success"
        redirect_to root_url
      else
        redirect_to new_order_url
      end
    else
      redirect_to login_path
    end
  end
  
  def destroy
    @order = Order.find_by id: params[:id]
    if @order.present?
      @order.destroy
      flash[:success] = t ".success"
      redirect_to order_url
    else
      flash[:danger] = t ".danger"
      redirect_to root_url
    end
  end

  private
  def order_params
    params.require(:order).permit(:receving_name, :receving_phonenumber, :receving_address,
                                   order_details_attributes: [:product_id, :quantity])
  end
end
