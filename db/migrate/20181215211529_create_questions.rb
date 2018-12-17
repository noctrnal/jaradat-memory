class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :survey, foreign_key: true
      t.integer :memory
      t.integer :first
      t.text :operand
      t.integer :second
      t.integer :answer
      t.boolean :veracity
      t.integer :recall

      t.timestamps
    end
  end
end
