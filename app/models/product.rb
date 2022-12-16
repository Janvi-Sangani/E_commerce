class Product < ApplicationRecord
  belongs_to :product_category
  validates :quantity,:price, format: {with: /\d/, message: "allows only positive number" },numericality: {greater_than_or_equal_to: 0 }
  has_many :cart_items, dependent: :destroy
  has_many :customer, through: :cart_items
  has_many :order_items, dependent: :destroy
  belongs_to :user
  has_one :wish_list, dependent: :destroy

  mount_uploader :image, FileUploader
  has_many :reviews, dependent: :destroy
  has_many :feedback_answers
end