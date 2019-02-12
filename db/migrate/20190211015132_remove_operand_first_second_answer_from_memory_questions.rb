class RemoveOperandFirstSecondAnswerFromMemoryQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :memory_questions, :operand, :text
    remove_column :memory_questions, :first, :integer
    remove_column :memory_questions, :second, :integer
    remove_column :memory_questions, :answer, :integer
  end
end
