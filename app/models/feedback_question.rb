class FeedbackQuestion < ApplicationRecord
  belongs_to :product_category
  has_many :feedback_answers
  has_many :feedback_question_options, inverse_of: :feedback_question, dependent: :destroy
  accepts_nested_attributes_for :feedback_question_options, allow_destroy: true,reject_if: :all_blank
  validates :question, presence: {message: "Should be present"}

  enum question_type:{single_choice: 0, multi_choice: 1, text: 2, drop_down: 3 }
end
