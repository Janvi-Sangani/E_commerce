class FeedbackAnswer < ApplicationRecord
  belongs_to :feedback_question
  belongs_to :feedback
  enum answer_type:{single_choice: 0, multi_choice: 1, text: 2, drop_down: 3 }
end
