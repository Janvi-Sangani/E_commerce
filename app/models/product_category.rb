class ProductCategory < ApplicationRecord
  validates :category, :description, :companies, presence: { message: "should be present"}
  validates :category, uniqueness: { message: "Already exists!!"}
  has_many :products, dependent: :destroy
end
