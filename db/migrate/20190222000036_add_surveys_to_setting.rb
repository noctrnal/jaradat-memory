class AddSurveysToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :surveys, :integer
  end
end
