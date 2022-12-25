class Product < ApplicationRecord
  include Filterable
  belongs_to :product_category
  validates :quantity,:price, format: {with: /\d/, message: "allows only positive number" },numericality: {greater_than_or_equal_to: 0 }
  has_many :cart_items, dependent: :destroy
  has_many :customer, through: :cart_items
  has_many :order_items, dependent: :destroy
  belongs_to :user
  has_one :wish_list, dependent: :destroy
  validates :name, :quantity, :product_category, :price, :image, presence: { message: "should be present"}
  validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }

  mount_uploader :image, FileUploader
  has_many :reviews, dependent: :destroy
  has_many :feedbacks

  scope :search, -> (search_value) {joins(:product_category).where("name ILIKE ? OR category ILIKE ?", "%#{search_value}%", "%#{search_value}%")}
  scope :price, -> (price_value){where("price < ?", price_value)}
end