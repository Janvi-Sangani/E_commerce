class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :category
      t.string :description
      t.string :companies

      t.timestamps
    end
  end
end
