class RemoveNumberOfQuestionsFromMemorySurvey < ActiveRecord::Migration[5.2]
  def change
    remove_column :memory_surveys, :number_of_questions, :integer
  end
end
