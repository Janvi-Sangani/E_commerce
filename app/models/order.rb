class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :order_items, dependent: :destroy
  has_many :cart_items, through: :order_items

  enum :status, [ :placed, :packed, :shipped, :deliverd ]
end
