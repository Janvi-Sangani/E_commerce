class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum :status, [ :placed, :packed, :shipped, :deliverd ]
end
