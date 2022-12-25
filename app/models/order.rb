class Order < ApplicationRecord
  include Filterable
  belongs_to :customer
  belongs_to :address
  has_many :order_items, dependent: :destroy
  has_many :cart_items, through: :order_items
  has_many :feedbacks

  enum status: {"placed"=>0, "packed"=>1, "shipped"=>2, "delivered"=>3}

  scope :search, -> (search_value) { joins(:customer, order_items: :product).where("customers.name ILIKE ? OR products.name ILIKE ?" , "%#{search_value}%", "%#{search_value}%")}
  scope :price, -> (price_value){ joins(:order_items).where("order_items.price <= ?", price_value)}
  scope :status, -> (status_value){ joins(:order_items).where("order_items.status = ?", OrderItem.statuses["#{status_value}"])}

  scope :place_order, -> (date_value){ where("DATE(created_at) = ?", "%#{date_value}%")}
end
