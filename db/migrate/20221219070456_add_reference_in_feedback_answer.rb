class AddReferenceInFeedbackAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedback_answers, :feedback, index: true
  end
end
