class AddSurveyToReadingSurvey < ActiveRecord::Migration[5.2]
  def change
    add_reference :reading_surveys, :survey, foreign_key: true
  end
end
