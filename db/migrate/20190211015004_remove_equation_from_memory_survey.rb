class RemoveEquationFromMemorySurvey < ActiveRecord::Migration[5.2]
  def change
    remove_reference :memory_surveys, :equation, foreign_key: true
  end
end
