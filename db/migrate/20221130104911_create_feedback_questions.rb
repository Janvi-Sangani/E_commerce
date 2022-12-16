class CreateFeedbackQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :feedback_questions do |t|
      t.string :question
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
