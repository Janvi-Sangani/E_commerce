class FeedbackQuestionOption < ApplicationRecord
  belongs_to :feedback_question
  validates :value, presence: {message: "Should be present"}

end
