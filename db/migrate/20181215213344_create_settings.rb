class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.boolean :allow_retake
      t.integer :delay
      t.integer :maximum_value
      t.integer :minimum_value
      t.integer :number_questions
      t.integer :number_surveys

      t.timestamps
    end
  end
end
