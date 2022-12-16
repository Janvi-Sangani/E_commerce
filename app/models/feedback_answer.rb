class FeedbackAnswer < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  belongs_to :feedback_question
end
