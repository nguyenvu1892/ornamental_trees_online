class OrdersController < ApplicationController
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
    params.require(:order).permit(:receving_name, :receving_address)
  end
end
