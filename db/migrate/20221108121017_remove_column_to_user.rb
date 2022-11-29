class RemoveColumnToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role, :string
    remove_column :customers, :role, :string
  end
end
