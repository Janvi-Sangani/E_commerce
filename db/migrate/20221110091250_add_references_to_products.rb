class AddReferencesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :product_category, null: false, foreign_key: true
    remove_column :products, :catagory, :string
    add_column :products, :price, :integer
  end
end
