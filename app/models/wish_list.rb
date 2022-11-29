class WishList < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  validates :product_id, :customer_id, :price, presence: { message: "should be present"}
  validates :product_id, uniqueness: { message: "Already exists!!"}
end
