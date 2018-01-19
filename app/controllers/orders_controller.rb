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

  def show
    @order = Order.find_by id: params[:id]
  end
  
  def destroy
    @order = Order.find_by id: params[:id]
    if @order.present?
      @order.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def order_params
    params.require(:order).permit(:receving_name, :receving_phonenumber,
                                  :receving_address, :status,
                                   order_details_attributes: [:product_id, :quantity])
  end
end
