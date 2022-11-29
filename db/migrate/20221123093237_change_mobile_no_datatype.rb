class ChangeMobileNoDatatype < ActiveRecord::Migration[7.0]
  def change
    change_column :addresses, :mobile_no, :bigint
  end
end
