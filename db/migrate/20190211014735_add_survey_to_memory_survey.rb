class AddSurveyToMemorySurvey < ActiveRecord::Migration[5.2]
  def change
    add_reference :memory_surveys, :survey, foreign_key: true
  end
end
