class AddEquationToMemorySurvey < ActiveRecord::Migration[5.2]
  def change
    add_reference :memory_surveys, :equation, foreign_key: true
  end
end
