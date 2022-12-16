class AddColumnAnswerType < ActiveRecord::Migration[7.0]
  def change
    add_column :feedback_questions, :question_type, :integer
  end
end
