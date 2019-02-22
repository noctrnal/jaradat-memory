class RemoveNumberQuestionNumberSurveysFromSetting < ActiveRecord::Migration[5.2]
  def change
    remove_column :settings, :number_questions, :integer
    remove_column :settings, :number_surveys, :integer
  end
end
