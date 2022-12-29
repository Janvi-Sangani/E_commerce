class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :amount
      t.string :payment_method
      t.string :stripe_payment_id

      t.timestamps
    end
  end
end
