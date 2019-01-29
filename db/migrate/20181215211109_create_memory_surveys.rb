class CreateMemorySurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_surveys do |t|
      t.integer :subject

      t.timestamps
    end
  end
end
