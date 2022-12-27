class Feedback < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  belongs_to :order
  has_many :feedback_answer, dependent: :destroy
end
