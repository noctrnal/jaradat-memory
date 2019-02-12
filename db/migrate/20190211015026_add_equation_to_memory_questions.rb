class AddEquationToMemoryQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :memory_questions, :equation, foreign_key: true
  end
end
