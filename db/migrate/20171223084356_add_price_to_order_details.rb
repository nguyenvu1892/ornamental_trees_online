class AddPriceToOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :order_details, :unit_price, :string
    add_column :order_details, :float, :string
  end
end
