class AddColumnInOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :product
    add_column :order_items, :quantity, :integer
    add_column :order_items, :price, :float
    remove_reference :order_items, :cart_items
    add_column :orders, :status, :string
  end
end
