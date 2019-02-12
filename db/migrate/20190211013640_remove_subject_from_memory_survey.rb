class RemoveSubjectFromMemorySurvey < ActiveRecord::Migration[5.2]
  def change
    remove_column :memory_surveys, :subject, :integer
  end
end
