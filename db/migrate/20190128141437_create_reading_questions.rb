class CreateReadingQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_questions do |t|
      t.references :reading_survey, foreign_key: true
      t.integer :memory
      t.integer :recall
      t.text :sentence
      t.boolean :veracity

      t.timestamps
    end
  end
end
