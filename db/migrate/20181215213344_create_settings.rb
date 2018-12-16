class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :number_questions
      t.integer :minimum_value
      t.integer :maximum_value
      t.boolean :allow_retake

      t.timestamps
    end
  end
end
