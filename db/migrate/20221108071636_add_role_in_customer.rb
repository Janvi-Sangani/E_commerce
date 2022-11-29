class AddRoleInCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :role, :string
    add_column :customers, :name, :string
  end
end
