class CreateFeedbackQuestionOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :feedback_question_options do |t|
      t.references :feedback_question, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
