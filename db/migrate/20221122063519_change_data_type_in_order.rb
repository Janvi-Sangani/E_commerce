class ChangeDataTypeInOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :status, :integer, using: 'status::integer'
    change_column :order_items, :status, :integer, using: 'status::integer'
  end
end
