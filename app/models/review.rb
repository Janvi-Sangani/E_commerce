class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  validates :rating, presence: {message: "Should be present"}
end
