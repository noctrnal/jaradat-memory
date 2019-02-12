class RemoveSubjectFromReadingSurvey < ActiveRecord::Migration[5.2]
  def change
    remove_column :reading_surveys, :subject, :integer
  end
end
