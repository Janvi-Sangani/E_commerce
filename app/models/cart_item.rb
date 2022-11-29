class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  has_many :orders, through: :order_items
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1, message: "please enter valid quantity"}
end
