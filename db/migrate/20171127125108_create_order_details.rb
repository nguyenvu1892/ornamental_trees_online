class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.float :unit_price
      t.integer :quantity
      t.float :total

      t.timestamps
    end
  end
end
