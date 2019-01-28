class CreateReadingSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_surveys do |t|
      t.integer :subject

      t.timestamps
    end
  end
end
