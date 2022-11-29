class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :city
      t.string :address_type
      t.integer :pincode
      t.string :state
      t.string :country
      t.string :telephone
      t.integer :mobile_no
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
