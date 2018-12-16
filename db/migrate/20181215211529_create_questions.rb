class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :survey, foreign_key: true
      t.integer :first
      t.integer :second
      t.text :operand
      t.boolean :result

      t.timestamps
    end
  end
end
