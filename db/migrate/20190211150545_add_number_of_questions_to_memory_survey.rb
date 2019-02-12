class AddNumberOfQuestionsToMemorySurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :memory_surveys, :number_of_questions, :integer
  end
end
