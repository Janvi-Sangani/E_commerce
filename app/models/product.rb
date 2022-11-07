class Product < ApplicationRecord
  validates :name, :quantity, :catagory, :status, presence: true
end
