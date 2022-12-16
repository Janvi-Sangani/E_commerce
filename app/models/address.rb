class Address < ApplicationRecord
  belongs_to :customer
  validates :address_type, inclusion: { in: %w(Home Office), message: "%{value} is not valid option."}
  validates :address_line1, :address_line2, :city, :address_type, :pincode, :state,:mobile_no, presence: {message: "Should be present"}
  validates :pincode, :mobile_no, format: {with: /\d/, message: "allows only positive number" }
  has_many :orders, dependent: :destroy
  validates :mobile_no,presence: true, numericality: true,format:{with: /\d{10}/}
end
