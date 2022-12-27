class CreateFeedbackAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :feedback_answers do |t|
      t.references :feedback_question, null: false, foreign_key: true
      t.string :answer_type
      t.string :answer

      t.timestamps
    end
  end
end
