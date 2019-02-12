class CreateEquations < ActiveRecord::Migration[5.2]
  def change
    create_table :equations do |t|
      t.string :equation
      t.string :veracity

      t.timestamps
    end
  end
end
