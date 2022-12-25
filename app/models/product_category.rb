class ProductCategory < ApplicationRecord
  validates :category, :description, :companies, presence: { message: "should be present"}
  validates :category, uniqueness: { message: "Already exists!!"}, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
  has_many :products, dependent: :destroy
  has_many :feedback_questions
end
