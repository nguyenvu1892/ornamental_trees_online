class Admin::OrdersController < ApplicationController
  include OrdersHelper

  def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.csv { send_data export_data, filename: "order.csv" }

    end
  end

  def export_data
    require 'csv'
    headers = ["ID", "Buyer", "Receiver", "Phone", "Address", "Status"]
    CSV.generate(headers: true) do |writer|
      writer << headers
      @orders.each do |order|
        writer << [order.id, order.user.name, order.receving_name,
                   order.receving_phonenumber, order.receving_address, order.isstatus]
      end
    end
  end
end
